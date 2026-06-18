                                    #  MASUK MATERI MATRIKS

import numpy as np

# 1. MATRIKS ORTOGONAL = matriks yg dikalikan dengan transposenya menghasilkan matriks identitas
Q = np.array([[0,-1],
              [1,0]])

print('contoh matriks ortogonal :', np.dot(Q.T, Q),'\n') # output = [[1 0]
                       #          [0 1]] = matriks identitas

# 2. MATRIKS SIMETRIS = matriks yg kalo di transpose ttp sm dengan matriks asli nya
A = np.array([[1,7,3],
              [7,4,-5],
              [3,-5,6]])

print('contoh matriks simetris: ', np.array_equal(A.T, A),'\n') # output : True
# equal digunakan untuk membandingkan. output = boolean (True/False)

# 3. MATRIKS DIAGONAL = matriks yg di luar diagonal nilai nya 0 
A = np.array([[5,1,2],
              [3,-2,4],
              [6,7,9]])

print(np.diag(A)) # output : [5 -2 9] = nilai diagonalnya saja
print('contoh matriks diagonal :', np.diag([5, -2, 9]),'\n') # output : [[ 5 0 0]
                       #                                               [0 -2 0]
                          #                                            [0 0 9]] = matriks diagonal

# 4. KESETARAAN MATRIKS = matriks yg memiliki nilai yang sama pada posisi yang sama
A = np.array([[2,4],
              [1,3]])
B = np.array([[2,4],
              [1,3]])

print('contoh matriks yang setara: ', np.array_equal(A, B),'\n') # output : True

# 5. OPERASI SKALAR MATRIKS 
A = np.array([[1,-2],
              [4,5]])
hasil = 3 * A # setiap elemen di kalikan dengan 3
print('contoh operasi skalar matriks :', hasil,'\n') # output : [[ 3 -6]
                       #                                         [12 15]] = setiap elemen di kalikan dengan 3

# 6. PERTAMBAHAN & PENGURANGAN MATRIKS 
A = np.array([[5,2],
              [3,1]])  
B = np.array([[1,4],
              [0,-2]])  

print('contoh pertambahan :', A + B) # output : [6,6], [3,-1]
print('contoh pengurangan :', A - B,'\n') # output : [4,-2], [3,3]

# 7. PERKALIAN MATRIKS 
A = np.array([[1,2],
              [3,4]])
B = np.array([[5,6],
              [7,8]])

print('contoh matriks perkalian :', A @ B,'\n') # output : [19,22], [43, 50]

# 8. DETERMINAN MATRIKS = invers / kebalikan di matriks
A = np.array([[4,2],
              [1,3]])

det_A = np.linalg.det(A)
print("contoh matriks determinan :", round(det_A),'\n') # output : 10
# round = untuk membulatkan angka agar hasil nya gak desimal.

# 9. INVERS MATRIKS 
A = np.array([[4,2],
              [1,3]])

inv_A = np.linalg.inv(A)
print('contoh matriks invers :', inv_A,'\n') # output : [[0.3 -0.2]
                       #                            [-0.1 0.4]] = invers dari matriks A

# 10. PERINGKAT MATRIKS 
A= np.array([[1,2],
             [2,4]])
print('contoh matriks peringkat :', np.linalg.matrix_rank(A),'\n') # output : 1

# 11. RUANG KOLOM = rentan yg di bangun oleh kolom-kolom matriks A
#     & RUANG NOL = himpunan semua vektor x sehingga Ax = 0
# from scipy.linalg import null_space

# A = np.array([[1, 2], 
#               [2, 4]])
# print(null_space(A)) # Output basis null space

# 11. PERUBAHAN BASIS = perubahan nilai pada kolom terakhir matriks untuk mengubah hasil prediksi model

x_old = np.array([3,4])
p = np.array([[1,0],
              [0,2]])
x_new = np.linalg.solve(p, x_old)
# solve digunakan untuk menyelesaikan sistem persamaan linear Ax = b, dalam hal ini p adalah matriks A dan x_old adalah vektor b.

print('matriks bais baru :', p) # output : [[1 0]
                       #                    [0 2]]
print("\nKoordinat di Basis Lama:", x_old) # output : [3,4]
print("Koordinat di Basis Baru:", x_new,'\n') # output : [3. 2.] = koordinat di basis baru setelah perubahan bais

# 12. MEMECAHAN SISTEM LINEAR 

A = np.array([[4, 2], 
              [1, 3]])
b = np.array([14, 11])
print(np.linalg.solve(A, b),'\n') # output : [2. 3.] = solusi dari sistem linear Ax = b

# 13. TRANSFORMASI LINEAR 2D & 3D
A = np.array([[2,0], 
              [0,2]])
x = np.array([3,5])
print("contoh transformasi linear :", A @ x,'\n') # output : [6,10] = hasil transformasi linear dari vektor x menggunakan matriks A

# 14. PERKALIAN MATRIKS SEBAGAI KOMPSISI
A = np.array([[3,0],
              [0,3]])
B= np.array([[1,0],
             [0,-1]])
X = np.array([1,1])

sekaligus = A @ (B @ X)
print('contoh perkalian matriks sebagai komposisi :', sekaligus) # output : [3, -3] = hasil komposisi transformasi linear dari vektor X menggunakan matriks A dan B

# 15. DOT PRODUCT DLM MATRIKS
U = np.array([3,4])
V = np.array([1,2])

print('contoh dot product matriks :', np.dot(U.T, V)) # output : 11 = hasil dot product antara vektor U dan V

# 16. PERKALIAN SILANG (CROSS PRODUCT) DLM MATRIKS
U = np.array([1,0,0])
V = np.array([0,1,0])

print('contoh cross product matriks :', np.cross(U, V)) # output : [0 0 1] = hasil cross product antara vektor U dan V