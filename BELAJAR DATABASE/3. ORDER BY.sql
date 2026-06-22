/* 											BAB 3. ORDER BY
yang digunakan untuk mengurutkan data dalam urutan menaik atau menurun.

Dua Aturan Main Utama: ASC dan DESC
	1. ASC(ascending) : - Mengurutkan data dari nilai paling kecil ke paling besar.
						- A - Z
	
    2. DESC(descending) : - Mengurutkan data dari nilai paling besar ke paling kecil.
						  - Z - A 
*/

USE mydb;

CREATE TABLE perusahaan(
	identitas INT PRIMARY KEY,
	nama VARCHAR (25),
    usia INT, 
    departemen VARCHAR(50)
);

INSERT INTO perusahaan(identitas, nama, usia, departemen)
VALUES 
	(1, 'John Doe', 30, 'HR'),
	(2, 'Jane Smith', 25, 'IT'),
	(3, 'Sam Brown', 35, 'Marketing'),
	(4, 'Michael Scott', 40, NULL);
    
SELECT *FROM perusahaan
ORDER BY usia; /* dri umur terkecil - terbesar*/

SELECT * FROM perusahaan 
ORDER BY usia DESC; /* kebalikan nya */

SELECT * FROM perusahaan 
WHERE departemen IS NOT NULL
ORDER BY departemen ASC, usia DESC;
						