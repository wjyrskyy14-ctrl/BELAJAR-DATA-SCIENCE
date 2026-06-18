import numpy as np 

# nilai eigen dan vektor eigen
A = np.array([[2,0],
              [0,3]])

# Fungsi otomatis mencari nilai eigen & Vektor eigen 
nilai_eigen, vektor_eigen = np.linalg.eig(A)              

print("nilai eigen (lambda) :", nilai_eigen) # output : [2. 3.]
print("vetor eigen (kolom) :", vektor_eigen,'\n') # output : [1,0], [0,1]

print('contoh lebih simple',np.linalg.eig(A)) # pakai ini aja biar langsung 

#2. analisa komponen utama (PCA)

A = np.array([[2,5],
              [4,3]])

# Langkah 1: Pusatkan data (Mean = 0)
A_centered = A - np.mean(A, axis = 0) # mengurangkan semua nilai di matriks A dengan nilai mean.
# axis 0 berarti kita menghitung mean untuk setiap kolom, sehingga setiap elemen dalam kolom akan dikurangi dengan mean kolom tersebut. Hasilnya adalah matriks A yang sudah dipusatkan (mean = 0).

# Langkah 2: Hitung Matriks Kovarians
n = A.shape[0] # jumlah data (baris) dalam matriks A = 2 baris 
C = (1 / n) * np.dot(A_centered.T, A_centered) # rumus nya 

# Langkah 3: Hitung Nilai & Vektor Eigen dari Kovarians
nilai_eigen, vektor_eigen = np.linalg.eig(C) 

print("Matriks Kovarians:\n", C)
print("Varians tiap komponen (Nilai Eigen):", nilai_eigen)
print("Arah Komponen Utama (Vektor Eigen):\n", vektor_eigen)