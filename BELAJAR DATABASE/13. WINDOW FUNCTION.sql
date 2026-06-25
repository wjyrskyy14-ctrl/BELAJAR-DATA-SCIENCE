/* 												BAB 13. WINDOW FUNCTION

WINDOW FUNCTION = fungsi SQL yang beroperasi pada sekumpulan baris yang terkait dengan baris saat ini.
				  Tidak seperti fungsi agregat, fungsi ini tidak menciutkan baris 
                  melainkan menambahkan nilai terhitung ke setiap baris.Fungsi Jendela sangat berguna untuk:
- Baris peringkat.
- Menghitung rata-rata bergerak.
- Mengambil nilai dari baris lain.
- Melakukan perhitungan kumulatif.

											WIDOW FUNCTION 
|ROW_NUMBER |Menetapkan bilangan bulat berurutan unik ke baris dalam partisi.|
|RANK |Menetapkan peringkat ke baris dalam partisi, dengan kesenjangan peringkat untuk ikatan.|
|DENSE_RANK |Mirip dengan RANK tetapi tanpa kesenjangan peringkat untuk ikatan.|
|NTILE |Membagi baris menjadi sejumlah grup tertentu dan menetapkan ID grup pada setiap baris.|
|LEAD dan LAG |Ambil nilai dari baris berikutnya atau sebelumnya dalam sebuah partisi.|
|FIRST_VALUE |Mengambil nilai pertama dalam sebuah partisi.|
|LAST_VALUE |Mengambil nilai terakhir dalam sebuah partisi.|
*/  

CREATE DATABASE IF NOT EXISTS hari_enam_belas;
USE hari_enam_belas;

-- Langkah A: Kita bikin tabel employees baru dengan data yang ada nilai kembarnya
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id INT,
    department_id VARCHAR(10),
    salary INT
);

INSERT INTO employees VALUES 
(1, 'HR', 5000), 
(2, 'HR', 7000), 
(3, 'HR', 7000), -- Gaji kembar buat ngetes RANK vs DENSE_RANK
(4, 'IT', 9000), 
(5, 'IT', 11000);

							-- [CONTOH 1 & 2] PERBEDAAN ROW_NUMBER, RANK, DAN DENSE_RANK

-- Skenario: Mengurutkan gaji paling gede (DESC) per departemen
-- --------------------------------------------------------------------
SELECT 
    employee_id, department_id, salary,
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS nomor_baris,
    RANK()       OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank_lompat,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank_rapat
FROM employees; 

/* VISUALISASI OUTPUT CONTOH 1 & 2:
+-------------+---------------+--------+-------------+-------------+------------+
| employee_id | department_id | salary | nomor_baris | rank_lompat | rank_rapat |
+-------------+---------------+--------+-------------+-------------+------------+
|           2 | HR            |   7000 |           1 |           1 |          1 | -> Juara 1 kembar
|           3 | HR            |   7000 |           2 |           1 |          1 | -> Juara 1 kembar
|           1 | HR            |   5000 |           3 |           3 |          2 | -> RANK melompat ke 3, DENSE_RANK tetep urut ke 2!
|           5 | IT            |  11000 |           1 |           1 |          1 | -> Masuk partisi IT, hitungan reset dari 1 lagi!
|           4 | IT            |   9000 |           2 |           2 |          2 |
*/
						
                        -- [CONTOH 4] LEAD DAN LAG (Melihat Data Baris Sebelum dan Sesudahnya)

-- Skenario: Diurutkan berdasarkan gaji dari kecil ke gede
-- --------------------------------------------------------------------
SELECT 
    employee_id, salary,
    LAG(salary)  OVER (ORDER BY salary) AS gaji_sebelumnya,
    LEAD(salary) OVER (ORDER BY salary) AS gaji_berikutnya
FROM employees;   

/* VISUALISASI OUTPUT CONTOH 4:
+-------------+--------+-----------------+-----------------+
| employee_id | salary | gaji_sebelumnya | gaji_berikutnya |
+-------------+--------+-----------------+-----------------+
|           1 |   5000 |            NULL |            7000 | -> Baris pertama gak punya masa lalu (NULL)
|           2 |   7000 |            5000 |            7000 |
|           3 |   7000 |            7000 |            9000 |
|           4 |   9000 |            7000 |           11000 |
|           5 |  11000 |            9000 |            NULL | -> Baris terakhir gak punya masa depan (NULL)
+-------------+--------+-----------------+-----------------+
*/

						-- [CONTOH 5 & 6] FIRST_VALUE, LAST_VALUE, DAN AKUMULASI (CUMULATIVE SUM)
-- --------------------------------------------------------------------
SELECT 
    employee_id, department_id, salary,
    FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary) AS gaji_terkecil,
    SUM(salary)         OVER (PARTITION BY department_id ORDER BY salary) AS gaji_kumulatif
FROM employees;

/* VISUALISASI OUTPUT CONTOH 5 & 6:
+-------------+---------------+--------+---------------+----------------+
| employee_id | department_id | salary | gaji_terkecil | gaji_kumulatif |
+-------------+---------------+--------+---------------+----------------+
|           1 | HR            |   5000 |          5000 |           5000 | -> Mulai dari 5000
|           2 | HR            |   7000 |          5000 |          19000 | -> Langsung nambahin 7000 + 7000 (karena gajinya kembar)
|           3 | HR            |   7000 |          5000 |          19000 | 
|           4 | IT            |   9000 |          9000 |           9000 | -> Ganti partisi IT, kumulatif reset dari awal lagi!
|           5 | IT            |  11000 |          9000 |          20000 | -> 9000 + 11000 = 20000
+-------------+---------------+--------+---------------+----------------+
*/                                  