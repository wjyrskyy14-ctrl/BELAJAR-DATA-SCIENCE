/* 									BAB 16. TRANSACTION AND CONCURRENCE

Transaksi adalah urutan satu atau lebih operasi SQL yang dieksekusi sebagai satu unit kerja logis.

### Perintah Transaksi
- **`BEGIN`**: Memulai transaksi.
- **`COMMIT`**: Menyimpan semua perubahan yang dilakukan dalam transaksi.
- **`ROLLBACK`**: Membatalkan semua perubahan yang dilakukan dalam transaksi.
- **`SAVEPOINT`**: Membuat titik dalam transaksi tempat Anda dapat melakukan rollback.
*/

CREATE DATABASE IF NOT EXISTS hari_sembilan_belas;
USE hari_sembilan_belas;

-- [PERSIAPAN DATA] Kita bikin tabel accounts sesuai contoh modul lu
DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_name VARCHAR(50),
    balance INT
);

INSERT INTO accounts VALUES 
(1, 'Rasky', 1500), 
(2, 'Andi', 500);

-- ====================================================================
-- 📘 1. PERINTAH TRANSAKSI (BEGIN, COMMIT, ROLLBACK, SAVEPOINT)
-- ====================================================================

-- Contoh A: Transaksi yang Sukses dan Disimpan (COMMIT)
-- Catatan MySQL: Perintah 'BEGIN' di MySQL ditulis 'START TRANSACTION'
START TRANSACTION;

UPDATE accounts SET balance = balance - 500 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 500 WHERE account_id = 2;

COMMIT; -- Menyimpan perubahan secara permanen ke harddisk
SELECT * FROM accounts; -- Hasil: Rasky jadi 1000, Andi jadi 1000

-- Contoh B: Transaksi yang Dibatalkan (ROLLBACK) karena eror/salah input
START TRANSACTION;
UPDATE accounts SET balance = balance - 10000 WHERE account_id = 1; -- Salah ketik kegedean!
ROLLBACK; -- Membatalkan semua ketikan di atas, data balik seperti semula sebelum START TRANSACTION
SELECT * FROM accounts; -- Hasil: Saldo aman, tetep Rasky=1000, Andi=1000

-- Contoh C: Menggunakan SAVEPOINT (Titik Penyelamat)
START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
SAVEPOINT sp1; -- Membuat titik penyelamat bernama sp1
UPDATE accounts SET balance = balance - 800 WHERE account_id = 1; -- Salah ketik lagi!
ROLLBACK TO sp1; -- Kembali ke kondisi aman saat titik sp1 (pengurangan 800 dibatalkan)
COMMIT; -- Amankan transaksi
SELECT * FROM accounts; -- Hasil: Rasky=900 (hanya berkurang 100)

-- ====================================================================
-- 💡 2. KONTROL KONKURENSI & TINGKAT ISOLASI (ISOLATION LEVEL)
-- ====================================================================

-- Cara Mengatur Tingkat Isolasi di MySQL (Sesuai Contoh Modul)
-- Pilihan: READ UNCOMMITTED, READ COMMITTED, REPEATABLE READ, SERIALIZABLE
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION;
SELECT * FROM accounts WHERE account_id = 1;
COMMIT;

-- ====================================================================
-- 🔒 3. MEKANISME PENGUNCIAN (SHARED LOCK & EXCLUSIVE LOCK)
-- ====================================================================

-- A. Shared Lock (Mengunci agar orang lain cuma bisa BACA, gak bisa EDIT)
-- Sintaks MySQL: Tambahkan FOR SHARE di ujung kueri
START TRANSACTION;
SELECT * FROM accounts WHERE account_id = 1 FOR SHARE;
COMMIT;

-- B. Exclusive Lock (Mengunci TOTAL, orang lain gak bisa baca/edit sampai kita COMMIT)
-- Sintaks MySQL: Tambahkan FOR UPDATE di ujung kueri
START TRANSACTION;
SELECT * FROM accounts WHERE account_id = 1 FOR UPDATE;
COMMIT;

