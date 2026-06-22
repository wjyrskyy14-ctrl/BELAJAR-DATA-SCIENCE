/*										 BAB 5. HAVING CLAUSE
Klausa `HAVING` digunakan untuk memfilter hasil grup yang dibuat oleh klausa `GROUP BY`.
Berbeda dengan klausa `WHERE`, yang memfilter baris sebelum pengelompokan, `HAVING` memfilter grup setelah agregasi.
*/

USE latihan;

CREATE TABLE perusahaan (
	identitas INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(50),
    usia INT,
    departemen VARCHAR(50),
    gaji INT
);

INSERT INTO perusahaan (nama, usia, departemen, gaji) 
VALUES
('Michael Scott', 40, 'Management', 9000000),
('Dwight Schrute', 35, 'Sales', 7500000),
('Jim Halpert', 30, 'Sales', 7000000),
('Pam Beesly', 28, 'HR', 5500000),
('John Doe', 30, 'HR', 5000000),
('Jane Smith', 25, 'IT', 8000000),
('Sam Brown', 35, 'Marketing', 6500000),
('Angela Martin', 38, 'Finance', 8500000),
('Kevin Malone', 36, 'Finance', 6000000),
('Oscar Martinez', 42, 'Finance', 8700000);

SELECT departemen,
SUM(gaji) AS total_pengeluaran
FROM perusahaan 
GROUP BY departemen
HAVING SUM(gaji) > 10000000;

SELECT departemen,
	COUNT(*) AS jumlah_karyawan
FROM perusahaan
GROUP BY departemen
HAVING COUNT(*) > 1;

SELECT departemen,
	COUNT(*) AS jumlah_karyawan
FROM perusahaan
GROUP BY departemen
HAVING jumlah_karyawan > 1;


