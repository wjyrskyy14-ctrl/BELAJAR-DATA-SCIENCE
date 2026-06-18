import numpy as np
from scipy.linalg import lu

# 1. Dekomposisi LU

A = np.array([[4,3],
              [8,5]])

# P adalah matriks permutasi (bawaan library komputer agar hitungan stabil)
P,L,U = lu(A)

print("contoh dekomposisi LU:")
print("Matriks L (Lower):", L)
print("Matriks U (Upper):", U,'\n')

# 2. Dekomposisi QR

A = np.array([[12,-51],
              [6,167]])

Q, R = np.linalg.qr(A)

print("contoh dekomposisi QR:")
print("Matriks Q (Ortogonal):", Q)
print("Matriks R (Segitiga Atas):", np.round(R),'\n')
print(np.linalg.qr(A)) # pakai ini aja biar langsung 2 output nya
# Bukti Q ortogonal (Q.T @ Q = Identitas)
print("Bukti Q.T @ Q:", np.round(Q.T @ Q),'\n')

# 3. Dekomposisi Nilai Singular

A = np.array([[1,2,3],
              [4,5,6]])

U, S, Vt = np.linalg.svd(A)              

print("contoh dekomposisi nilai singular :")
print("Matriks U :\n", U)
print("Nilai Singular S :", S) # NumPy menghemat memori dengan mengembalikan array 1D
print("Matriks V Transpose :", Vt,'\n')
print(np.linalg.svd(A)) # pakai ini aja biar langsung 3 output nya

# 4. Faktorisasi Matriks Non-Negatif (NMF)

from sklearn.decomposition import NMF

# Data simulasi positif (misal: frekuensi kata dalam dokumen)
A = np.array([[1, 2], 
              [3, 4], 
              [5, 6]])

model = NMF(n_components=2, init='random', random_state=0)
W = model.fit_transform(A) #Training = Ini proses belajar
H = model.components_ #Ambil H = Setelah training, H diambil dari model

print("contoh Faktorisasi Matriks Non-Negatif (NMF)")
print("Matriks W (Fitur Basis):\n", W) # Isinya pasti positif semua!
print("Matriks H (Koefisien):\n", H,'\n')   # Isinya pasti positif semua!   
print(model.fit_transform(A)) # pakai ini aja biar langsung 2 output nya           