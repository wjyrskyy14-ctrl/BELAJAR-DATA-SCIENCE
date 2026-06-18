import numpy as np

v = np.array([1, -2, 2])

norm_L1 = np.linalg.norm(v, ord=1) # menjumlahkan mutlak
norm_L2 = np.linalg.norm(v, ord=2) # rumus Pythagoras
norm_Linft= np.linalg.norm(v, ord=np.inf) # ambil mutlak terbesar

print('contoh L1 : ', norm_L1,'\n') #output : 5
print('contoh L2 : ', norm_L2,'\n') #output : 3.0
print('contoh L infinite : ', norm_Linft,'\n') #output : 2.0

# tanda mutlak = |1| 
# dan semua nilai mutlak itu menjadi POSITIF