import numpy as np

v = np.array([3, 4])

# Opsi 1: Menggunakan fungsi bawaan aljabar linear NumPy
norma_opsi1 = np.linalg.norm(v) #PAKE INII LEBIH MUDAH!!!!!

# Opsi 2: Menggunakan rumus manual akar dari perkalian titik (dot product) dirinya sendiri
norma_opsi2 = np.sqrt(np.dot(v, v))

print(norma_opsi1) # Hasilnya pasti 5.0 (karena akar dari 3^2 + 4^2 = akar(25) = 5)