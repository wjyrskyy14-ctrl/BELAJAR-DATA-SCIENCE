										-- 	BAB 7. ADVANCED JOINS



-- --------------------------------------------------------------------
-- [CONTOH 1] MATERIAL: SELF JOIN (Bergabung Sendiri)
-- --------------------------------------------------------------------
 -- PENJELASAN :
 -- Self join adalah regular join dimana sebuah tabel digabungkan dengan tabel itu sendiri.
 -- Ini berguna untuk membandingkan baris dalam tabel yang sama.

-- Langkah A: Bersihkan dan Buat Tabel
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

-- Langkah B: Masukkan Data Hirarki Karyawan
INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'Daud', 2);

-- Langkah C: Tampilkan Hasil Self Join (Staf & Bos)
SELECT k.name AS staf, m.name AS bos
FROM employees k
LEFT JOIN employees m
    ON k.manager_id = m.employee_id;


-- --------------------------------------------------------------------
-- [CONTOH 2] MATERIAL: FULL OUTER JOIN (Gabung Luar Penuh)
-- --------------------------------------------------------------------

-- PENJELASAN :
-- Gabungan luar penuh mengembalikan semua baris dari kedua tabel, dengan `NULL` di kolom yang tidak ada kecocokan.

-- Langkah A: Bersihkan dan Buat Tabel Pelanggan & Pesanan
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT
);

-- Langkah B: Masukkan Data Pelanggan & Pesanan
INSERT INTO customers (customer_id, name) VALUES
(1, 'Yohanes'),
(2, 'Sarah'),
(3, 'Michael');

INSERT INTO orders (order_id, customer_id, amount) VALUES
(101, 1, 100),
(102, 4, 200);

-- Langkah C: Tampilkan Hasil Full Outer Join (Menggunakan Trik UNION)
SELECT k.name, m.amount
FROM customers k
LEFT JOIN orders m ON k.customer_id = m.customer_id

UNION 

SELECT k.name, m.amount
FROM customers k
RIGHT JOIN orders m ON k.customer_id = m.customer_id;  

-- --------------------------------------------------------------------
-- [CONTOH 3] MATERIAL: CROSS JOIN (Gabung Silang)
-- --------------------------------------------------------------------

-- PENJELASAN
-- Gabungan silang mengembalikan produk Cartesian dari dua tabel.
-- Setiap baris pada tabel pertama digabungkan dengan setiap baris pada tabel kedua.


-- Langkah A: Bersihkan dan Buat Tabel Produk & Warna
DROP TABLE IF EXISTS colors;
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

CREATE TABLE colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(50)
);

-- Langkah B: Masukkan Data Sesuai Modul
INSERT INTO products (product_id, product_name) VALUES
(1, 'Pena'),
(2, 'Buku catatan');

INSERT INTO colors (color_id, color_name) VALUES
(1, 'Merah'),
(2, 'Biru');

-- Langkah C: Tampilkan Hasil Kombinasi Produk dan Warna
SELECT p.product_name, c.color_name
FROM products p
CROSS JOIN colors c;  

-- --------------------------------------------------------------------
-- [CONTOH 4] MATERIAL: JOIN DENGAN AGREGAT (SUM & GROUP BY)
-- --------------------------------------------------------------------

-- PENJELASAN :
-- Gabungan dapat digabungkan dengan fungsi agregat untuk meringkas data di beberapa tabel.

-- Langkah A: Bersihkan dan Buat Tabel
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT
);

-- Langkah B: Masukkan Data Sesuai Modul
INSERT INTO customers (customer_id, name) VALUES
(1, 'Yohanes'),
(2, 'Sarah');

INSERT INTO orders (order_id, customer_id, amount) VALUES
(101, 1, 100),  -- Yohanes belanja 100
(102, 1, 150),  -- Yohanes belanja lagi 150
(103, 2, 200);  -- Sarah belanja 200

-- Langkah C: Hitung Total Penjualan Menggunakan SUM & GROUP BY
SELECT c.name, SUM(o.amount) AS total_sales
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.name;

-- --------------------------------------------------------------------
-- [CONTOH 5] MATERIAL: ADVANCED JOIN (MENGGABUNGKAN 3 TABEL)
-- --------------------------------------------------------------------

-- Langkah A: Bersihkan dan Buat 3 Tabel Sekaligus
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT
);

-- Langkah B: Masukkan Data Latihan
INSERT INTO customers VALUES (1, 'Yohanes'), (2, 'Sarah');
INSERT INTO products VALUES (10, 'Laptop'), (20, 'Mouse');

-- Yohanes beli Laptop (10), Sarah beli Mouse (20)
INSERT INTO orders VALUES (501, 1, 10), (502, 2, 20);

-- Langkah C: Jalankan Kueri Gabungan 3 Tabel dari Modul
SELECT o.order_id, c.name AS customer_name, p.product_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

                                





