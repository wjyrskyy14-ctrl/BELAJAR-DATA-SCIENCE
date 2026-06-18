# Bedanya Apa? Angka di dalamnya bisa sama persis, tapi orientasi posisinya berbeda.
# Vektor Baris (r): Berjejer ke samping. 
# Vektor Kolom (c): Berjejer ke bawah. 

import numpy as np 

x = np.array([1, 2, 3]) 
print(x, "\n")                                  # Ini array 1D biasa (tidak punya orientasi baris/kolom)

x_col = x.reshape((3, 1))     
print("jadi vektor kolom",x_col,'\n')           # Resmi jadi Vektor Kolom (3 baris, 1 kolom) 
                                                #output : [[1]
                                                #          [2]
                                                #          [3]]

x_row = x.reshape((1, 3))     
print("jadi vektor baris", x_row, "\n")         # Resmi jadi Vektor Baris (1 baris, 3 kolom)
                                                #output : [[1 2 3]]

                            # LATIHAN : MENGHITUNG PERKALIAN MATRIKS

# Jika x_col berbentuk (3,1), maka x_col.T berbentuk (1,3)
# Perkalian (1x3) @ (3x1) akan menghasilkan matriks (1x1) alias skalar tunggal
hasil = x_col.T @ x_col 
print(hasil) # Hasilnya adalah [[14]] (karena 1*1 + 2*2 + 3*3 = 14)



# beda nya (*) dengan (@)
# klo (*) = hanya mengkali setiap angka saja dan hasil nya akan menjadi matrix biasa 
# klo (@) = dia mengalikan dan menjumlahkan semua hasil yg sudah di kali
