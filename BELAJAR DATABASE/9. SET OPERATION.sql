/* 											BAB 9. SET OPERATION

**Set Operations** = menggabungkan hasil dari dua atau lebih pernyataan `SELECT`.
					 Operasi ini memperlakukan hasil kueri sebagai kumpulan dan melakukan operasi seperti gabungan, 
					 persimpangan, dan perbedaan.

### Poin Penting:
- Semua kueri yang terlibat dalam operasi kumpulan harus memiliki jumlah kolom yang sama.
- Kolom harus memiliki tipe data yang kompatibel.
- Urutan kolom penting. 
*/  

CREATE DATABASE hari_sebelas; 
CREATE DATABASE IF NOT EXISTS hari_sebelas;
USE hari_sebelas;

-- Langkah A: Bersihkan dan Buat Tabel Departemen A & B
DROP TABLE IF EXISTS department_a;
DROP TABLE IF EXISTS department_b;

CREATE TABLE department_a (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE department_b (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Langkah B: Masukkan Data Sesuai Skenario Modul Kamu
-- Alice ada di kedua departemen, Bob cuma di A, Charlie (Karol) cuma di B
INSERT INTO department_a VALUES (1, 'Alice'), (2, 'Bob');
INSERT INTO department_b VALUES (1, 'Alice'), (3, 'Karol'); 

								-- [CONTOH 1] UNION (Gabung + Hapus Duplikat)
-- Hasil: Alice (cuma muncul 1x), Bob, Karol
-- --------------------------------------------------------------------
SELECT name FROM department_a
UNION
SELECT name FROM department_b; 

							-- [CONTOH 2] UNION ALL (Gabung Mentah + Duplikat Ikut)
-- Hasil: Alice (muncul 2x karena gak disaring), Bob, Karol 

SELECT name FROM department_a
UNION ALL
SELECT name FROM department_b;

						-- [CONTOH 3] INTERSECT (Irisan / Cari yang Ada di Kedua Tabel)
-- Hasil: Alice (karena cuma Alice yang kerja di dua departemen)
-- --------------------------------------------------------------------
SELECT name FROM department_a
INTERSECT
SELECT name FROM department_b;

						-- [CONTOH 4] EXCEPT (Pengurangan / Ada di A tapi GAK ADA di B)
-- Hasil: Bob (karena Alice ada di B, jadi dicoret)
-- --------------------------------------------------------------------
SELECT name FROM department_a
EXCEPT
SELECT name FROM department_b;

        