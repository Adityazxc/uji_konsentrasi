import os,math
from flask import render_template, request,session, redirect, url_for, Response
# from flask_paginate import Pagination, get_page_args
import pandas as pd
# mengambil file 
from preprocessing import persiapan_data,atribut_gelombang,gelombang_otak,data_latih
from werkzeug.utils import secure_filename
from lvq import LVQ, main
from datetime import datetime
from connection import Pengguna, get_nama_pegawai_from_database, db, GelombangOtak, app,db



app.secret_key = 'your_actual_secret_key_here'
ob=LVQ()


# Fungsi untuk mengambil data dari tabel dan menyimpan sebagai CSV
def export_to_csv():
    data = GelombangOtak.query.all()
    data_list = [{  'id_gelombang': row.id_gelombang, 
                    'nip': row.nip, 
                    'nama_pegawai': row.nama_pegawai,
                    'departemen':row.departemen,
                    'rA': row.rA,
                    'rB': row.rB,
                    'rG': row.rG,
                    'stdA': row.stdA,
                    'stdB': row.stdB,
                    'stdG': row.stdG,
                    'absA': row.absA,
                    'absB': row.absB,
                    'absG': row.absG,                    
                    'tingkat_konsentrasi': row.tingkat_konsentrasi,
                    'tanggal':row.tanggal } for row in data]
    return data_list

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


# Menentukan direktori upload file
UPLOAD_FOLDER = os.path.join('static', 'uploads')
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Menentukan extension apa saja yang dapat diterima
ALLOWED_EXTENSIONS = {'csv'}
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

 # Route untuk halaman dashboard
@app.route('/dashboard', methods=['GET', 'POST'])
def upload_csv():
    if 'username' not in session:
        return redirect(url_for('login'))
    
    # mengambil data dari input form di file dashboard
    input_nip= request.form.get('nip')
    hasil="hasil"
    response_message = None
    result = None    
    output_atribut = None
    processed_data=None
   
    data_gelombang_otak=GelombangOtak.query.all()  
    x=[0.08185722, 0.09502756, 0.04491122, 0.06503574, 0.05635585,
       0.03786717, 0.08185722, 0.09502756, 0.04491122] 
    y=[0.02269997, 0.01751783, 0.03700718, 0.04299396, 0.0460799 ,
        0.03779127, 0.02269997, 0.01751783, 0.03700718]
            

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
                output_atribut=atribut_gelombang(uploaded_df)                
                processed_data = persiapan_data(uploaded_df)
                input_nip=request.form.get('nip')
                input_nama=request.form.get('nama_pegawai')
                input_departemen=request.form.get('departemen')

                # pengambilan data latih
                
               
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
                weights=main()
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
              

            print(processed_data)
    
    return render_template(
        'dashboard.html',
        hasil=hasil,
        x=x,y=y,
        data=data_gelombang_otak,
        response_message=response_message,
        result=result,
        output_atribut=output_atribut,        
        processed_data=processed_data,
        data_latih=data_latih

        )

@app.route('/export_csv')
def export_csv():
    data_gelombang_otak = GelombangOtak.query.all()
    df = pd.DataFrame([{
        'NIP': data.nip,
        'Nama Pegawai': data.nama_pegawai,
        'Departemen': data.departemen,
        'Tingkat Konsentrasi': data.tingkat_konsentrasi,
        'Tanggal': data.tanggal
    } for data in data_gelombang_otak])
    
    csv_output = df.to_csv(index=False, columns=['NIP', 'Nama Pegawai', 'Departemen', 'Tingkat Konsentrasi', 'Tanggal'])
    
    response = Response(
        csv_output,
        content_type="text/csv",
        headers={"Content-Disposition": "attachment; filename=data_gelombang_otak.csv"}
    )
    
    return response


def process_uploaded_file(file):
    data_filename = secure_filename(file.filename)
    file_path = os.path.join(app.config['UPLOAD_FOLDER'], data_filename)
    file.save(file_path)
    session['uploaded_data_file_path'] = file_path
    return data_filename, file_path





if __name__ == '__main__':
    app.run(debug=True,host="0.0.0.0")