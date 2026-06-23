/* 										BAB 8. SUBQUERI

**Subkueri** adalah kueri yang disarangkan di dalam kueri SQL lain.Subkueri dapat:

- Digunakan dalam klausa `SELECT`, `FROM`, atau `WHERE`.
- Memberikan hasil antara untuk kueri utama.
- Membuat pertanyaan kompleks lebih mudah dibaca dan dipelihara.

JENIS JENIS SUBKUERI :

 **Subkueri Baris Tunggal:** Mengembalikan satu baris dengan satu kolom.
 **Subkueri Multi-Baris:** Mengembalikan beberapa baris dengan satu kolom.
 **Subkueri Multi-Kolom:** Mengembalikan beberapa baris dengan beberapa kolom.
 **Subkueri Berkorelasi:** Bergantung pada kueri luar untuk eksekusinya.
 **Subkueri Tidak Berkorelasi:** Jalankan secara independen dari kueri luar.
 
SYNTAX : 
SELECT column1, column2
FROM table_name
WHERE column3 = (SELECT aggregate_function(column4) FROM table_name WHERE condition); 

### Poin Penting:
- Subkueri diapit tanda kurung `()`.
- Mereka dapat menggunakan fungsi agregat seperti `SUM`, `COUNT`, `AVG`.
- Penempatannya bergantung pada klausa (misalnya, `SELECT`, `FROM`, atau `WHERE`).
*/

										-- CONTOH LATIHAN 

CREATE DATABASE hari_sembilan;
USE hari_sembilan;

-- Langkah A: Bersihkan dan Buat Tabel Sesuai Modul
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary INT,
    department_id INT,
    department_name VARCHAR(50) -- Kita satukan namanya biar kueri FROM kamu langsung jalan
);

INSERT INTO employees VALUES 
(1, 'Yohanes', 75000, 10, 'IT'),   -- Di atas rata-rata perusahaan & departemen
(2, 'Sarah',   80000, 10, 'IT'),   -- Di atas rata-rata perusahaan & departemen
(3, 'Michael', 55000, 10, 'IT'),   -- Di bawah rata-rata
(4, 'David',   40000, 20, 'HR');   -- Departemen kecil

									-- [CONTOH 1] SUBQUERY PADA KLAUSUL WHERE
-- Mencari karyawan yang gajinya di atas rata-rata seluruh perusahaan (> 62.500)

SELECT employee_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

									-- [CONTOH 2] SUBQUERY PADA KLAUSA SELECT
-- Menampilkan gaji karyawan bersanding dengan rata-rata departemennya sendiri

SELECT employee_name, salary,
       (SELECT AVG(salary)
        FROM employees e2 -- sebagai kalkulator 
        WHERE e1.department_id = e2.department_id) AS avg_department_salary
FROM employees e1; -- table utama nya/ mading istilah nya

									-- [CONTOH 3] SUBQUERY PADA KLAUSA FROM
-- Mencari nama departemen yang total pengeluaran gajinya paling tinggi

SELECT department_name, total_salary
FROM (SELECT department_id, department_name, SUM(salary) AS total_salary
      FROM employees
      GROUP BY department_id, department_name) AS department_totals
WHERE total_salary = (SELECT MAX(total_salary)
                      FROM (SELECT department_id, SUM(salary) AS total_salary
                            FROM employees
                            GROUP BY department_id) AS department_totals);
                            
									-- [CONTOH 4] SUBQUERY BERKORELASI
-- Mencari orang yang gajinya di atas rata-rata departemennya masing-masing

SELECT employee_name, salary
FROM employees e1
WHERE salary > (SELECT AVG(salary)
                FROM employees e2 -- sebagai kalkulator
                WHERE e1.department_id = e2.department_id);
