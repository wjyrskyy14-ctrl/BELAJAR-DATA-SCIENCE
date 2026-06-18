from flask import Flask, render_template, request, redirect, url_for
# Impor semua alat tempur: Flask (mesin), render_template (tampilan), request (ambil data), redirect (pindah halaman).

import os  # Impor modul untuk urusan sistem (seperti ambil nomor port dari server).

app = Flask(__name__)
# Nyalakan mesin Flask dengan nama file ini sebagai pusatnya.

app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0
# Trik supaya browser tidak menyimpan cache lama; jadi kalau ganti CSS, tampilannya langsung berubah.

@app.route('/')  # Alamat untuk pintu masuk utama (Home).
def home():
    techs = ['HTML', 'CSS', 'Flask', 'Python'] # Data list teknologi untuk ditampilkan di web.
    name = '30 Days Of Python Programming' # Judul besar di halaman utama.
    return render_template('home.html', techs=techs, name=name, title='Home') # Kirim data ke HTML home.

@app.route('/about') # Alamat untuk halaman 'Tentang Kami'.
def about():
    name = '30 Days Of Python Programming'
    return render_template('about.html', name=name, title='About Us') # Tampilkan halaman about.

@app.route('/result') # Alamat untuk halaman hasil setelah analisis selesai.
def result():
    return render_template('result.html') # Tampilkan halaman hasil.

@app.route('/post', methods=['GET', 'POST']) # Alamat khusus untuk input teks (bisa ambil dan setor data).
def post():
    name = 'Text Analyzer'
    if request.method == 'GET':
        # Kondisi saat user baru buka halaman: Kasih formulir kosong.
        return render_template('post.html', name=name, title=name)
    
    if request.method == 'POST':
        # Kondisi saat user klik tombol submit: Tangkap data yang diketik.
        content = request.form['content'] # Ambil teks dari kotak input yang namanya 'content'.
        print(content) # Munculkan teks di terminal VS Code untuk pengecekan.
        return redirect(url_for('result')) # Setelah dicatat, pindahkan user ke halaman hasil secara otomatis.

if __name__ == '__main__':
    # Bagian untuk menyalakan server secara otomatis.
    
    # Ambil nomor port dari internet (server) atau pakai 5000 jika di laptop sendiri.
    port = int(os.environ.get("PORT", 5000))
    
    # Jalankan aplikasi dengan fitur debug nyala (auto-update kalau ada perubahan kode).
    app.run(debug=True, host='0.0.0.0', port=port)