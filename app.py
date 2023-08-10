import os,json
from flask import Flask, render_template, request,session, redirect, url_for
from flask_sqlalchemy import SQLAlchemy #library koneksi ke mysql
import pandas as pd
# mengambil file 
from preprocessing import persiapan_data
from werkzeug.utils import secure_filename
from lvq import LVQ, main
from datetime import datetime



app = Flask(__name__)
app.secret_key = 'your_actual_secret_key_here'
ob=LVQ()
weights=main()

# Konfigurasi database URI
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://Aditya:Aditya@localhost/konsentrasi'
# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:password_baru@localhost/konsentrasi'
db = SQLAlchemy(app)

# Definisi model untuk tabel database (pengguna)
class Pengguna(db.Model):
    nip = db.Column(db.String(8), primary_key=True)
    nama_pegawai = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(100), nullable=False)

    def __repr__(self):
        return f'<Pengguna {self.nip}>'

def get_nama_pegawai_from_database(nip):
    pengguna = Pengguna.query.filter_by(nip=nip).first()
    if pengguna:
        return {'nama_pegawai': pengguna.nama_pegawai}
    return None

# Route untuk halaman login
@app.route('/login', methods=['GET', 'POST'])
def login():    
    response_message = ""

    if request.method == 'POST':
        # Dapatkan data dari form
        username = request.form['nip']
        password = request.form['password']

        # Gunakan tabel Pengguna untuk login
        user = Pengguna.query.filter_by(nip=username).first()

        # Lakukan proses autentikasi sederhana
        if user and user.password == password:
            response_message = "Login berhasil!"
            session['username'] = username  # Simpan username di session

            # Ambil nama pegawai dari database berdasarkan username
            data_pegawai = get_nama_pegawai_from_database(username)
            session['nama_pegawai'] = data_pegawai['nama_pegawai'] if data_pegawai else None
            
            return redirect(url_for('upload_csv'))
        else:
            response_message = "Login gagal. Periksa kembali username dan password Anda."

    # Kirimkan pesan respon ke template login.html
    return render_template('login.html' ,response_message=response_message)




#gelombang otak
class GelombangOtak(db.Model):
    __tablename__ = 'gelombang_otak' 
    id_gelombang=db.Column(db.Integer, primary_key=True)    
    nip=db.Column(db.Integer())    
    nama_pegawai=db.Column(db.String(100))
    departemen=db.Column(db.String(100))
    rA=db.Column(db.Float())
    rB=db.Column(db.Float())
    rG=db.Column(db.Float())
    stdA=db.Column(db.Float())
    stdB=db.Column(db.Float())
    stdG=db.Column(db.Float())
    absA=db.Column(db.Float())
    absB=db.Column(db.Float())
    absG=db.Column(db.Float())
    tingkat_konsentrasi=db.Column(db.String(20))
    tanggal=db.Column(db.DateTime, nullable=False, default=datetime.utcnow())


# Menentukan direktori upload file
UPLOAD_FOLDER = os.path.join('staticFiles', 'uploads')
# Menentukan extension apa saja yang dapat diterima
ALLOWED_EXTENSIONS = {'csv'}

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
 # Route untuk halaman dashboard
@app.route('/dashboard', methods=['GET', 'POST'])
def upload_csv():
    if 'username' not in session:
        return redirect(url_for('login'))
    response_message = None
    result = None
    data_gelombang_otak = GelombangOtak.query.all()
    # mengambil data dari input form di file dashboard
    input_nip= request.form.get('nip')

    if request.method == 'POST':
       
        uploaded_file = request.files.get('csv_file')

        if uploaded_file:
            tanggal = datetime.now().strftime("%Y-%m-%d %H:%M:%S")            
            _, data_file_path = process_uploaded_file(uploaded_file)
            uploaded_df = pd.read_csv(data_file_path, encoding='unicode_escape')

            if len(uploaded_df) < 70:
                response_message = "Data kurang dari 70"
            else:
                # proses upload data hasil ke database
                processed_data = persiapan_data(uploaded_df)
                input_nip=request.form.get('nip')
                input_nama=request.form.get('nama_pegawai')
                input_departemen=request.form.get('departemen')

            
                # proses lvq
                data_uji = {
                    'rA': processed_data['rA'],
                    'rB': processed_data['rB'],
                    'rG': processed_data['rG'],
                    'stdA': processed_data['stdA'],
                    'stdB': processed_data['stdB'],
                    'stdG': processed_data['stdG'],
                    'absA': processed_data['absA'],
                    'absB': processed_data['absB'],
                    'absG': processed_data['absG'],
                }
                data_uji = pd.DataFrame([data_uji])
                # Proses data uji
                prediksi=ob.winner(weights,data_uji.values[0])
                
                # Interpretasikan hasil prediksi
                if prediksi == 1:
                    tingkat_konsentrasi = 'Konsentrasi Tinggi'
                else:
                    tingkat_konsentrasi = 'Konsentrasi Rendah'

                # Prepare the data for database insertion
                item = {
                    'nip': input_nip,
                    'nama_pegawai':input_nama,
                    'departemen':input_departemen,
                    'rA': processed_data['rA'],
                    'rB': processed_data['rB'],
                    'rG': processed_data['rG'],
                    'stdA': processed_data['stdA'],
                    'stdB': processed_data['stdB'],
                    'stdG': processed_data['stdG'],
                    'absA': processed_data['absA'],
                    'absB': processed_data['absB'],
                    'absG': processed_data['absG'],                    
                    'tingkat_konsentrasi': tingkat_konsentrasi,
                    'tanggal':tanggal
                }                    

                new_entry = GelombangOtak(**item)
                db.session.add(new_entry)
                db.session.commit()
                result = processed_data

    data_gelombang_otak = GelombangOtak.query.all()
    return render_template('dashboard.html', data=data_gelombang_otak,response_message=response_message, result=result)

def process_uploaded_file(file):
    data_filename = secure_filename(file.filename)
    file_path = os.path.join(app.config['UPLOAD_FOLDER'], data_filename)
    file.save(file_path)
    session['uploaded_data_file_path'] = file_path
    return data_filename, file_path


if __name__ == '__main__':
    app.run(debug=True)