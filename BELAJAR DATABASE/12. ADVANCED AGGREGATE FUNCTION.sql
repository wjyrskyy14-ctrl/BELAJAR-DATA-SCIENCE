/* 						BAB 12. ADVANCED AGREGATE FUNCTIONS( fungsi agregrat tingkat lanjut)

Fungsi agregat SQL sangat penting untuk meringkas dan menganalisis data.

Fungsi ini membantu Anda:
- Menggabungkan string menjadi satu nilai.
- Menghitung ukuran statistik seperti median, varians, dan deviasi standar.
- Melakukan agregasi hierarkis dengan `ROLLUP` dan `CUBE`.
- Menangani agregasi berbeda secara lebih fleksibel.

Jenis Fungsi Agregasi Tingkat Lanjut 🏆

| **Fungsi** | **Deskripsi** |
|--|-|
| **`VARIANCE`** | Menghitung varians kolom numerik. |
| **`STDDEV`** | Menghitung deviasi standar kolom numerik. |
| **`MEDIAN`** | Menemukan nilai median kolom numerik. |
| **`PERCENTILE_DISC`** | Mengembalikan persentil tertentu (diskrit). |
| **`PERCENTILE_CONT`** | Mengembalikan persentil tertentu (kontinu). |
| **`CUME_DIST`** | Menghitung distribusi kumulatif suatu nilai dalam kumpulan hasil. |
| **`NTILE`** | Membagi baris menjadi sejumlah grup yang ditentukan dan menetapkan ID grup. |

**1. GROUP_CONCAT / STRING_AGG**
- **Tujuan**: Menggabungkan nilai dari beberapa baris menjadi satu string.
- **Basis Data yang Didukung**:
- `GROUP_CONCAT` (MySQL)
- `STRING_AGG` (PostgreSQL, SQL Server)


SYNTAX :
													- MySQL: 
  ```sql
  SELECT GROUP_CONCAT(column_name SEPARATOR ', ') AS concatenated_values
  FROM table_name;
  ```
  
													- PostgreSQL:
  ```sql
  SELECT STRING_AGG(column_name, ', ') AS concatenated_values
  FROM table_name;
  ```
  */
  
CREATE DATABASE IF NOT EXISTS hari_lima_belas;
USE hari_lima_belas;

-- Langkah A: Bikin Tabel Sales Sesuai Contoh Modul
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    region VARCHAR(50),
    salesperson VARCHAR(50),
    sales_amount INT
);

INSERT INTO sales VALUES 
('North', 'Alice', 5000), 
('South', 'Bob', 7000), 
('East',  'Karol', 6000), 
('West',  'Dani', 8000), 
('North', 'Chandra', 5500);

					-- [CONTOH 1] GROUP_CONCAT (Menggabungkan Teks Antar Baris Jadi Satu)
-- Skenario: Pengen tahu siapa aja nama sales per wilayah, digabung pakai koma
-- --------------------------------------------------------------------
SELECT region, GROUP_CONCAT(salesperson SEPARATOR ', ') AS daftar_sales
FROM sales
GROUP BY region;

								-- contoh 2. Ukuran Statistika (STDDEV & VARIANCE)
-- untuk menghitung sebaran data numerik.
SELECT STDDEV(sales_amount) AS simpangan_baku, VARIANCE(sales_amount) AS varians_data
FROM sales;

								-- contoh 3. Membuat Subtotal Otomatis (WITH ROLLUP)
/* untuk membuat total hierarki/total keseluruhan di baris paling bawah laporan, 
	kita pasang kata WITH ROLLUP di sebelah GROUP BY. (MySQL tidak mendukung perintah CUBE).*/
SELECT region, SUM(sales_amount) AS total
FROM sales
GROUP BY region WITH ROLLUP;	

									-- contoh 4. Membagi Kelompok Data (NTILE)
-- fungsi NTILE() untuk membagi baris data menjadi beberapa kelompok sama rata setelah diurutkan.
SELECT sales_amount, NTILE(2) OVER (ORDER BY sales_amount) AS group_id
FROM sales;