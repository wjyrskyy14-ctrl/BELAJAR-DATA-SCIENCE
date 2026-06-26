/* 									BAB 15. INDEX AND OPTIMIZATION 

Indeks adalah struktur data yang meningkatkan kecepatan pengambilan data.

### 📘 Memahami Indeks

#### 1. Jenis-Jenis Indeks
- **Indeks Utama**			: Dibuat secara otomatis pada kunci utama.
- **Indeks Unik**			: Memastikan nilai unik pada kolom yang diindeks.
- **Indeks Klaster**		: Mengurutkan dan menyimpan baris data dalam tabel berdasarkan nilai kunci.
- **Indeks Non-Klaster**	: Menyimpan penunjuk ke baris data sebenarnya.
- **Indeks Komposit**		: Mengindeks beberapa kolom.
- **Indeks Teks Lengkap**	: Dioptimalkan untuk pencarian teks.
*/

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount INT
);

INSERT INTO customers VALUES (12345, 'Rasky', 'USA'), (67890, 'Andi', 'Indonesia');
INSERT INTO orders VALUES (101, 12345, '2024-05-12', 1500), (102, 67890, '2024-06-15', 3000);

-- ====================================================================
-- 📘 MEMAHAMI INDEKS (BAGIAN 1)
-- ====================================================================

-- 1. Contoh Tanpa Indeks (Komputer membaca baris demi baris secara manual)
SELECT * FROM orders WHERE customer_id = 12345;

-- 2. Contoh Dengan Indeks (Membuat indeks baru untuk customer_id)
-- Sintaks: CREATE INDEX nama_indeks ON nama_tabel(nama_kolom);
CREATE INDEX idx_customer_id ON orders(customer_id);
SELECT * FROM orders WHERE customer_id = 12345;

-- 3. Membuat dan Mengelola Indeks
-- A. Creating an Index (Membuat indeks di kolom order_date)
CREATE INDEX idx_order_date ON orders(order_date);

-- B. Viewing Existing Indexes (Melihat Indeks yang Ada)
-- Catatan: pg_indexes itu milik Postgres, di MySQL perintah resminya adalah:
SHOW INDEX FROM orders;

-- C. Dropping an Index (Menghapus Indeks)
-- Sintaks MySQL: DROP INDEX nama_indeks ON nama_tabel;
DROP INDEX idx_order_date ON orders;

-- ====================================================================
-- 🔧 TEKNIK OPTIMASI KUERI (BAGIAN 2)
-- ====================================================================

-- 1. Menganalisis Rencana Kueri (Menggunakan EXPLAIN)
EXPLAIN SELECT * FROM orders WHERE order_date > '2024-01-01';

-- 2. Menghindari Kesalahan Umum (Optimasi Pemfilteran Tanggal)
--  Gunakan cara ini (Cepat karena menggunakan rentang nilai tanggal asli):
SELECT * FROM orders WHERE order_date >= '2024-01-01' AND order_date < '2025-01-01';

-- 3. Mengoptimalkan Penggabungan (JOIN) dan Subkueri
--  Kueri yang Dioptimalkan (Optimized Query menggunakan CTE + JOIN):
WITH US_Customers AS (
    SELECT customer_id
    FROM customers
    WHERE country = 'USA'
)
SELECT orders.* FROM orders
INNER JOIN US_Customers ON orders.customer_id = US_Customers.customer_id;

