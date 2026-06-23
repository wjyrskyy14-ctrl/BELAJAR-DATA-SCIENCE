/*									11. DATE AND TIME FUNCTIONS

** DATE AND TIME FUNCTIONS **  Ini berguna banget di dunia nyata, misalnya buat menghitung umur pengguna, 
							   menghitung estimasi paket sampai di e-commerce, atau bikin laporan bulanan otomatis.
*/

CREATE DATABASE IF NOT EXISTS hari_tiga_belas;
USE hari_tiga_belas;

-- --------------------------------------------------------------------
-- [BAGIAN 1] FUNGSI DASAR TANGGAL (WAKTU SEKARANG & EKSTRAKSI)
-- --------------------------------------------------------------------
-- Catatan: Fungsi NOW() akan mengambil tanggal & waktu real-time laptop kamu sekarang (Tahun 2026)
SELECT 
    CURRENT_DATE() AS hari_ini,       -- OUTPUT: '2026-06-23'
    CURRENT_TIME() AS jam_sekarang,   -- OUTPUT: '23:45:19'
    NOW() AS waktu_lengkap,           -- OUTPUT: '2026-06-23 23:45:19'
    
    -- Mengekstrak bagian tertentu dari tanggal/datetime
    YEAR('2024-12-28') AS ambil_tahun,   -- OUTPUT: 2024
    MONTH('2024-12-28') AS ambil_bulan,  -- OUTPUT: 12
    DAY('2024-12-28') AS ambil_hari;     -- OUTPUT: 28


-- --------------------------------------------------------------------
-- [BAGIAN 2] CONTOH PRAKTIS: TABEL PEMESANAN BARANG (OPERASI MATEMATIKA TANGGAL)
-- --------------------------------------------------------------------
DROP TABLE IF EXISTS orders_table;
CREATE TABLE orders_table (
    order_id INT,
    customer_name VARCHAR(50),
    tanggal_beli DATETIME
);

-- Kita masukkan data simulasi belanja
INSERT INTO orders_table VALUES 
(1, 'Rasky', '2026-06-01 10:00:00'),
(2, 'Andi',  '2026-06-15 14:30:00');

-- Kita mainkan fungsi manipulasi tanggalnya
SELECT 
    customer_name,
    tanggal_beli,
    
    -- 1. DATE() & TIME(): Memisahkan tanggal dan jam ghaib dari DATETIME
    DATE(tanggal_beli) AS tgl_doang,  -- OUTPUT Baris 1: '2026-06-01'
    TIME(tanggal_beli) AS jam_doang,  -- OUTPUT Baris 1: '10:00:00'
    
    -- 2. DATEDIFF(): Menghitung selisih hari (Tanggal Kiri dikurang Tanggal Kanan)
    -- Kita hitung sudah berapa hari sejak Rasky beli barang sampai tanggal '2026-06-10'
    DATEDIFF('2026-06-10', tanggal_beli) AS selisih_hari, -- OUTPUT Baris 1: 9 (10 dikurang 1)
    
    -- 3. DATE_ADD(): Menambahkan interval waktu (Misal: Tanggal Estimasi Paket Sampai +7 hari)
    DATE_ADD(tanggal_beli, INTERVAL 7 DAY) AS estimasi_sampai, -- OUTPUT Baris 1: '2026-06-08 10:00:00'
    
    -- 4. DATE_SUB(): Mengurangi interval waktu (Misal: Pengen tahu H-1 bulan sebelum beli)
    DATE_SUB(tanggal_beli, INTERVAL 1 MONTH) AS sebulan_lalu, -- OUTPUT Baris 1: '2026-05-01 10:00:00'
    
    -- 5. DATE_FORMAT(): Mengubah tampilan tanggal jadi bahasa manusia (Keren banget nih!)
    -- %W = Nama Hari, %M = Nama Bulan, %d = Tanggal, %Y = Tahun Angka 4 Digit
    DATE_FORMAT(tanggal_beli, '%W, %M %d, %Y') AS format_cantik -- OUTPUT Baris 1: 'Monday, June 01, 2026'
FROM orders_table;




/* VISUALISASI OUTPUT UTAMA DI RESULT GRID WORKBENCH:
+---------------+---------------------+------------+-----------+--------------+---------------------+---------------------+-----------------------+
| customer_name | tanggal_beli        | tgl_doang  | jam_doang | selisih_hari | estimasi_sampai     | sebulan_lalu        | format_cantik         |
+---------------+---------------------+------------+-----------+--------------+---------------------+---------------------+-----------------------+
| Rasky         | 2026-06-01 10:00:00 | 2026-06-01 | 10:00:00  |            9 | 2026-06-08 10:00:00 | 2026-05-01 10:00:00 | Monday, June 01, 2026 |
| Andi          | 2026-06-15 14:30:00 | 2026-06-15 | 14:30:00  |           -5 | 2026-06-22 14:30:00 | 2026-05-15 14:30:00 | Monday, June 15, 2026 |
+---------------+---------------------+------------+-----------+--------------+---------------------+---------------------+-----------------------+
*/