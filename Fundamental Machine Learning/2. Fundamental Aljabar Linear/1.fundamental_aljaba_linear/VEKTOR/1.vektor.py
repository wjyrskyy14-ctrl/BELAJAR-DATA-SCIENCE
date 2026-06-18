                    # LATIHAN 1. BUAT VEKTOR 3 DIMENSI, LALU MENCETAK KOMPONEN, BENTUK SHAPE & TIPE DATA NYA

import numpy as np

#membuat 2 vektor 3D
u = np.array([1.0, 3.0, 5.0])
v = np.array([2.0, -1.0, 0.5])

# Mencetak komponen, bentuk, dan tipe
print("Komponen u:", u)
print("Bentuk (Shape) u:", u.shape) # Outputnya (3,) artinya array 1D dengan 3 elemen
print("Tipe Data u:", u.dtype)

print("gabungan u dan v :" , np.array([u, v])) # Outputnya [[ 1.  3.  5.]
                                                        #  [ 2. -1.  0.5]]
print(np.array([u, v]).shape) # Outputnya (2, 3) artinya array 2D dengan 2 baris dan 3 kolom