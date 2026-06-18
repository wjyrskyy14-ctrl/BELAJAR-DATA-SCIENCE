                                    # ini yg paling sering di pakai di formula machine learning

import numpy as np 

# 1. Moore–Penrose Pseudoinverse

A = np.array([[1,2,3],
              [4,5,6]])

A_pinv = np.linalg.pinv(A)

print(" contoh Moore Penrose Pseudoinverse")
print("Matriks Asli A (2x3):\n", A)
print("\nHasil Pseudoinverse A+ (3x2):\n", A_pinv,'\n')
print(np.linalg.pinv(A)) # pakai ini aja biar langsung output nya

# 2. Bentuk Kuadrat (Quadratic Form)

A= np.array([[3,0],
             [0,4]])
X = np.array([1,2])             

operasi = X.T @ A @ X

print("Hasil Bentuk Kuadrat (Skalar):", operasi,'\n') # Output: 19.0

# 3. matriks pasti positif (positive definite matrix)

A = np.array([[3, 0],
              [0, 4]])

# Cara cek paling gampang: lihat nilai eigennya
nilai_eigen, _ = np.linalg.eig(A)
apakah_pasti_positif = np.all(nilai_eigen > 0) #np.all untuk cek semua elemen apakah > 0

print("Contoh Matriks Pasti positif")
print("Nilai Eigen:", nilai_eigen)
print("Apakah Pasti Positif?:", apakah_pasti_positif,'\n') # Output: True

# 4. produk hadamard (Hadamard Product)

A = np.array([[1,3],
              [2,4]])
B = np.array([[5,7],
              [6,8]])

print("Contoh Produk Hadamard", A * B) # Output: [[ 5 21]
                                      #          [12 32]]
                                      