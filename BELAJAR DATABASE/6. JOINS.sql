/* 												BAB 6. JOINS
JOINS adalah yang menggabungkan baris dari dua tabel atau lebih berdasarkan kolom terkait.Mereka membantu dalam:
	- Mengakses data yang didistribusikan di beberapa tabel.
	- Menciptakan hubungan yang bermakna antar entitas data.
	- Menyederhanakan kueri untuk kumpulan data yang kompleks.

4 Jenis JOINS:
--	INNER JOIN(Gabung Dalam) -> Hanya mengambil data yang pencocokannya pas/ada di kedua tabel.
--	LEFT JOIN(Gabung Kiri)   -> Ambil SEMUA data dari tabel kiri (Utama), plus data tabel kanan yang cocok. 
								    Kalau tabel kanan gak ada pasangannya, isinya bakal ditulis NULL (kosong).
--	RIGHT JOIN(Kanan Join)   -> Kebalikan dari Left Join. Ambil SEMUA data dari tabel kanan, baru dicocokkin ke kiri.
--	FULL OUTER JOIN			 -> Sapu bersih! Ambil semua data dari kiri dan kanan, mau cocok atau gak, semuanya ditampilin.
*/

CREATE DATABASE contoh;
USE contoh;

CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
    nama_pelanggan VARCHAR(50),
    kota VARCHAR(30)
);

CREATE TABLE pesanan (
    id_pesanan INT PRIMARY KEY AUTO_INCREMENT,
    id_pelanggan INT, -- Kolom jembatan ke tabel pelanggan
    nama_barang VARCHAR(50),
    harga INT
);

INSERT INTO pelanggan (nama_pelanggan, kota) VALUES 
('Alice', 'Jakarta'),
('Bob', 'Bandung'),
('Charlie', 'Surabaya'),
('Dani', 'Medan'); -- -> Dani sengaja belum beli apa-apa

INSERT INTO pesanan (id_pelanggan, nama_barang, harga) VALUES 
(1, 'Sepatu Nike', 1200000), -- Dibeli oleh Alice (id 1)
(2, 'Sepatu Adidas', 1500000), -- Dibeli oleh Bob (id 2)
(1, 'Kaos Kaki Puma', 150000), -- Dibeli oleh Alice (id 1)
(NULL, 'Tali Sepatu', 20000); -- -> Gak ada id_pelanggan (Pembeli Misterius)


SELECT p.nama_pelanggan, s.nama_barang, s.harga
FROM pelanggan AS p
INNER JOIN pesanan AS s
	ON p.id_pelanggan = s.id_pelanggan;
    
SELECT p.nama_pelanggan, s.nama_barang
FROM pelanggan AS p
LEFT JOIN pesanan AS s
	ON P.id_pelanggan = s.id_pelanggan;
    
SELECT p.nama_pelanggan, s.nama_barang
FROM pelanggan AS p
RIGHT JOIN pesanan AS s 
    ON p.id_pelanggan = s.id_pelanggan;
    
SELECT p.nama_pelanggan, s.nama_barang, s.harga
FROM pelanggan AS p
LEFT JOIN pesanan AS s 
    ON p.id_pelanggan = s.id_pelanggan

UNION -- Menyatukan hasil kiri dan kanan

SELECT p.nama_pelanggan, s.nama_barang, s.harga
FROM pelanggan AS p
RIGHT JOIN pesanan AS s 
    ON p.id_pelanggan = s.id_pelanggan;

