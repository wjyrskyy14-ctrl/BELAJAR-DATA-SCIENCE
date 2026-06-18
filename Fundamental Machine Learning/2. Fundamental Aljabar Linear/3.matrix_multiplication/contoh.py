import numpy as np

A = np.array([[4,9,9],
              [9,1,6],
              [9,2,3]])
B = np.array([[1,2],
              [5,7],
              [4,4]])

# perkalian biasa 
print("Hasil perkalian biasa:\n", A @ B) 

# nah di sini kita akan coba balik jadi B @ A dan lihat apa yg terjadi
try:
    print("Hasil perkalian terbalik:\n", B @ A)
except ValueError as err:
    print("Error:", err)