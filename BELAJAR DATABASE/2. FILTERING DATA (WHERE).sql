									/* BAB 2 : WHERE / FILTERING DATA

OPERATOR :
(=) = sama dengan
(<>) = atau
(!=) = tidak sama dengan
(>) = lebih besar
(<) = kurang dari
(>=) = lebih besar sama dengan
(<=) = kurang dari sama dengan

OPERATOR LOGIKA = bisa digabung dengan ini 
(AND) = semua syarat wajib benar
(OR) = salah satu syarat benar sudah cukup
(NOT) = negasi

PENCOCOKAN POLA (LIKE)
Simbol % = Mewakili banyak karakter acak atau nol karakter. misal mau filter org yg ada di nama huruf depan nya R
Simbol _ = Mewakili tepat satu karakter acak.

FILTERING NULL
IS NULL: Untuk mencari data yang kosong/bolong.
IS NOT NULL: Untuk mencari data yang sudah terisi (tidak kosong).


*/

USE mydb;

CREATE TABLE perusahaan(
	identitas INT PRIMARY KEY,
	nama VARCHAR (25),
    usia INT, 
    departemen VARCHAR(50)
);

INSERT INTO perusahaan(identitas, nama, usia, departemen)
VALUES 
	(1, 'John Doe', 30, 'HR'),
	(2, 'Jane Smith', 25, 'IT'),
	(3, 'Sam Brown', 35, 'Marketing'),
	(4, 'Michael Scott', 40, NULL);
    
SELECT * FROM perusahaan;

SELECT * FROM perusahaan -- mengambil org yg huruf awal nya J
WHERE nama LIKE 'J%';

SELECT * FROM perusahaan -- mengambil yg nilai nya kosong/ NULL
WHERE departemen IS NULL;

SELECT * FROM perusahaan -- Mengambil org yg usia nya > 20
WHERE usia > 20;

SELECT * FROM perusahaan -- mengabil yg kerja di IT & Marketing
WHERE departemen = 'IT' OR departemen = 'Marketing';

SELECT * FROM perusahaan -- Ambil karyawan yang namanya mengandung 'Smith':
WHERE nama LIKE '%Smith%';



