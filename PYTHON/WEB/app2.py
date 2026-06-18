from flask import Flask, render_template # mengimpor Flask dan render_template dari modul flask
import os # mengimpor modul os untuk mengakses variabel lingkungan (environment variables)

app2 = Flask(__name__) # membuat objek Flask dengan nama app2 (bisa menggunakan nama lain sesuai keinginan)

@app2.route('/')
def home():
    return render_template('home.html') # membuat rute untuk halaman utama (home) dengan URL '/' dan mengembalikan template home.html

@app2.route('/about')
def about():
    return render_template('about.html') # membuat rute untuk halaman about dengan URL '/about' dan mengembalikan template about.html

if __name__ == '__main__': # menjalankan aplikasi web jika file ini dijalankan langsung (bukan diimpor sebagai modul)
    port = int(os.environ.get('PORT', 5000)) # mengambil nilai port dari variabel lingkungan 'PORT' jika ada, jika tidak ada maka menggunakan port 5000
    app2.run(debug=True, host='0.0.0.0', port=port) # menjalankan aplikasi web dengan mode debug (untuk memudahkan pengembangan), host '