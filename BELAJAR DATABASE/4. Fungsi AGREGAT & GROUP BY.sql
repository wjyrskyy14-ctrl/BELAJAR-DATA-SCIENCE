/*  									BAB 4. Fungsi AGREGAT & GROUP BY

1. FUNGSI AGREGAT = Fungsi matematika buat ngitung rangkuman data.
--    * COUNT() -> Buat ngitung jumlah total baris/orang.
--    * SUM()   -> Buat ngitung total penjumlahan angka (misal: total gaji).
--    * AVG()   -> Buat ngitung rata-rata angka (misal: rata-rata usia).
--    * MIN()   -> Buat nyari nilai paling kecil/paling muda.
--    * MAX()   -> Buat nyari nilai paling besar/paling tua.

2. GROUP BY = Logika "Ember Kelompok". 
--    Digunakan buat memecah hasil hitungan fungsi agregat di atas 
--    berdasarkan kategori tertentu (misal: dihitung per departemen).
*/

CREATE DATABASE latihan;
USE latihan;

CREATE TABLE perusahaan (
	identitas INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(50),
    usia INT,
    departemen VARCHAR(50),
    gaji INT
);

INSERT INTO perusahaan (nama, usia, departemen, gaji) 
VALUES
('Michael Scott', 40, 'Management', 9000000),
('Dwight Schrute', 35, 'Sales', 7500000),
('Jim Halpert', 30, 'Sales', 7000000),
('Pam Beesly', 28, 'HR', 5500000),
('John Doe', 30, 'HR', 5000000),
('Jane Smith', 25, 'IT', 8000000),
('Sam Brown', 35, 'Marketing', 6500000),
('Angela Martin', 38, 'Finance', 8500000),
('Kevin Malone', 36, 'Finance', 6000000),
('Oscar Martinez', 42, 'Finance', 8700000);

SELECT 
    departemen, 
    COUNT(*) AS jumlah_orang
FROM perusahaan
GROUP BY departemen;

SELECT departemen,
SUM(gaji) AS total_pengeluaran
FROM perusahaan 
GROUP BY departemen;

SELECT departemen,
	MIN(usia) AS usia_paling_muda,
    MAX(usia) AS usia_paling_tua
FROM perusahaan 
GROUP BY departemen
ORDER BY usia_paling_muda ASC;

SELECT departemen,
	AVG(gaji) AS ratarata_gaji
FROM perusahaan
GROUP BY departemen
ORDER BY ratarata_gaji DESC;

SELECT departemen,
	MIN(gaji) AS gaji_terkecil,
    MAX(gaji) AS gaji_terbesar
FROM perusahaan
GROUP BY departemen
ORDER BY gaji_terkecil ASC;
