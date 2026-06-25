/* 										BAB 14. COMMON TABLE EXPRESSION

CTE = kumpulan hasil sementara yang menyederhanakan kueri kompleks

sangat berguna untuk:
- Membagi kueri kompleks menjadi langkah-langkah logis.
- Membuat komponen kueri yang dapat digunakan kembali.
- Mengimplementasikan kueri rekursif.
*/

CREATE DATABASE IF NOT EXISTS hari_tujuh_belas;
USE hari_tujuh_belas;

-- Langkah A: Kita buat tabel karyawan yang punya hubungan Bos dan Anak Buah
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(50),
    manager_id INT -- ID milik Bos-nya si karyawan
);

INSERT INTO employees VALUES 
(1, 'CEO Big Boss', NULL), -- Gak punya bos (Manager_id NULL)
(2, 'Manajer Rasky', 1),   -- Bosnya adalah ID 1 (CEO)
(3, 'Manajer Andi',  1),   -- Bosnya adalah ID 1 (CEO)
(4, 'Staff Joko',    2),   -- Bosnya adalah ID 2 (Rasky)
(5, 'Staff Siti',    2);   -- Bosnya adalah ID 2 (Rasky)

								-- [CONTOH 1] CTE STANDAR (Menyederhanakan Kueri)

-- Skenario: Kita bikin tabel bayangan isinya cuma Staff aja, baru kita filter
-- --------------------------------------------------------------------
WITH HanyaStaff AS (
    -- Di dalam kurung ini adalah adonan tabel bayangan kita
    SELECT employee_id, employee_name, manager_id
    FROM employees
    WHERE employee_name LIKE 'Staff%'
)
-- Di bawah ini adalah kueri utama kita yang memakai tabel bayangan di atas
SELECT * FROM HanyaStaff 
WHERE manager_id = 2;

/* VISUALISASI OUTPUT CONTOH 1:
+-------------+---------------+------------+
| employee_id | employee_name | manager_id |
+-------------+---------------+------------+
|           4 | Staff Joko    |          2 |
|           5 | Staff Siti    |          2 |
+-------------+---------------+------------+
*/

					-- [CONTOH 2] CTE REKURSIF (Menelusuri Hierarki Jabatan / Silsilah Pohon)

-- Catatan: Untuk MySQL wajib menyertakan kata RECURSIVE setelah WITH
-- --------------------------------------------------------------------
WITH RECURSIVE StrukturOrganisasi AS (
    -- 1. ANCHOR: Ambil level paling puncak (CEO)
    SELECT employee_id, employee_name, manager_id, 1 AS tingkatan_level
    FROM employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- 2. RECURSIVE: Gabungkan anak buah yang nyambung ke level di atasnya secara berulang
    SELECT e.employee_id, e.employee_name, e.manager_id, so.tingkatan_level + 1
    FROM employees e
    INNER JOIN StrukturOrganisasi so ON e.manager_id = so.employee_id
)
SELECT * FROM StrukturOrganisasi ORDER BY tingkatan_level;

/* VISUALISASI OUTPUT CONTOH 2:
+-------------+---------------+------------+-----------------+
| employee_id | employee_name | manager_id | tingkatan_level |
+-------------+---------------+------------+-----------------+
|           1 | CEO Big Boss  |       NULL |               1 | -> Level 1 (Top)
|           2 | Manajer Rasky |          1 |               2 | -> Level 2 (Middle)
|           3 | Manajer Andi  |          1 |               2 | -> Level 2 (Middle)
|           4 | Staff Joko    |          2 |               3 | -> Level 3 (Staff)
|           5 | Staff Siti    |          2 |               3 | -> Level 3 (Staff)
+-------------+---------------+------------+-----------------+
*/

