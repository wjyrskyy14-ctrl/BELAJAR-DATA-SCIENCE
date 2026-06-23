/*										 10. STRING FUNCTIONS

** STRING FUNCTION ** digunakan untuk memanipulasi atau mengambil informasi dari data string.
					  Baik Anda membersihkan data yang berantakan, mengekstraksi bagian teks yang bermakna, 
                      atau memformat string untuk pelaporan, fungsi string SQL sangat diperlukan.
*/

CREATE DATABASE hari_duabelas;
USE hari_duabelas;                                            

DROP TABLE IF EXISTS contoh_teks;
CREATE TABLE contoh_teks (
    id INT,
    pesan VARCHAR(50)
);

INSERT INTO contoh_teks VALUES (1, 'hello world'), (2, 'SQL');

-- Sekarang kita tes fungsi dasarnya pakai data dari tabel
SELECT 
    pesan,
    UPPER(pesan) AS huruf_besar,     -- OUTPUT Baris 1: 'HELLO WORLD'
    LOWER(pesan) AS huruf_kecil,     -- OUTPUT Baris 1: 'hello world'
    LENGTH(pesan) AS total_karakter, -- OUTPUT Baris 1: 11 (spasi ikut dihitung)
    LEFT(pesan, 5) AS potong_kiri,   -- OUTPUT Baris 1: 'hello'
    RIGHT(pesan, 5) AS potong_kanan, -- OUTPUT Baris 1: 'world'
    REVERSE(pesan) AS balik_kata     -- OUTPUT Baris 2: 'LQS'
FROM contoh_teks;

				-- CONTOH SOAL 1. STRING FUNCTIONS (MANIPULASI DATA TEKS) - VERSI FIX

-- 1. UPPER & LOWER (Mengubah Huruf Besar / Kecil)
SELECT 
	UPPER('hello') AS uupercase, 
    LOWER('WORLD') AS lowercase;
    
-- 2. LENGTH (Menghitung Jumlah Karakter, Spasi Ikut Dihitung)
SELECT
	LENGTH('hello world') AS total_length; -- output  = 11
    
-- 3. TRIM (Memotong Spasi Ghaib di Ujung Kiri dan Kanan)
SELECT 
	TRIM('     hello      ') AS trimmed; -- output = hello(no spasi jadi rapih)
    
-- 4. SUBSTRING (Memotong Teks: Dimulai dari huruf ke-1, ambil 5 karakter)
SELECT
	SUBSTRING('hello world', 1, 5) AS sub ; -- output = hello

-- 5. CONCAT (Menggabungkan Teks/Kolom jadi Satu)
SELECT
    CONCAT('hello', ' ', 'world') AS gabung; -- OUTPUT: 'hello world'
    
-- 6. REPLACE (Mengganti Kata: Kata 'world' diganti jadi 'SQL')
SELECT
    REPLACE('hello world', 'world', 'SQL') AS ganti; -- OUTPUT: 'hello SQL'
    
-- 7. INSTR (Mencari Posisi Huruf/Kata ke-berapa. Kata 'world' dimulai dari huruf ke-7)
SELECT
    INSTR('hello world', 'world') AS posisi; -- OUTPUT: 7
    
    -- 8. LEFT & RIGHT (Potong Teks dari Ujung Kiri atau Ujung Kanan)
    SELECT
		LEFT('hello world', 5) AS dari_kiri,   -- OUTPUT: 'hello'
		RIGHT('hello world', 5) AS dari_kanan; -- OUTPUT: 'world'
    
    -- 9. LPAD & RPAD (Menggenapi Panjang Teks dengan Karakter Tambahan)
    -- 'SQL' panjangnya 3, digenapin jadi 5 karakter dengan nambahin '*' di kiri/kanan
    SELECT
		LPAD('SQL', 5, '!') AS rata_kiri,  -- OUTPUT: '!!SQL'
		RPAD('SQL', 5, '*') AS rata_kanan; -- OUTPUT: 'SQL**'
    
    -- 10. REVERSE (Membalikkan Kata)
    SELECT
		REVERSE('SQL') AS terbalik; -- OUTPUT: 'LQS'
    
