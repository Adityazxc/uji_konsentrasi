from flask import Flask
from flask_sqlalchemy import SQLAlchemy #library koneksi ke mysql
from datetime import datetime


app = Flask(__name__)
app.secret_key = 'your_actual_secret_key_here'
# Konfigurasi database URI
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://Aditya:Aditya@localhost/konsentrasi'

# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:password_baru@localhost/konsentrasi'

# aktifkan sebelum deploy
# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:root@172.17.0.2:3306/konsentrasi'
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

class GelombangOtak(db.Model):
    __tablename__ = 'gelombang_otak' 
    id_gelombang=db.Column(db.Integer, primary_key=True)    
    nip = db.Column(db.String(100)) 
    nama_pegawai=db.Column(db.String(100))    
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