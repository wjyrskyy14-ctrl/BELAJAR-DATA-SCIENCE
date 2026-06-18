									/* BAB 1 : CREATE & SELECT

1. CREATE: Cara membangun wadahnya (Tabel).
2. SELECT: Cara ngambil atau ngintip isi data di dalam wadah tersebut.  

*/

CREATE DATABASE mydb; -- buat database

CREATE TABLE mahasiswa( -- buat kolom untuk table (blm ada isi (value) nya
	mahasiswa_id INT PRIMARY KEY, -- **`student_id`**: Bilangan bulat yang mengidentifikasi setiap siswa secara unik.
    nama VARCHAR(100) NOT NULL, -- **`name`**: String hingga 100 karakter.
    age INT, -- **`age`**: Bilangan bulat yang mewakili usia siswa.
    enrollment_date DATE -- **`enrollment_date`**: Tanggal yang menunjukkan kapan siswa mendaftar.
);

INSERT INTO mahasiswa (mahasiswa_id, nama, age, enrollment_date) -- masukan nama agar table punya value
VALUES 
	(1,'Rasky', 21, '2024-01-10'),
    (2, 'steven', 20, '2024-01-10'),
    (3, 'budi', 21, '2024-01-10'),
    (4, 'citra', 19, '2024-01-10'),
    (5, 'dewi', 20, '2024-01-10');
    
SELECT*FROM mahasiswa; -- menampilkan semua table 

SELECT nama, age FROM mahasiswa -- menampilkan kolom nama & age saja



	
