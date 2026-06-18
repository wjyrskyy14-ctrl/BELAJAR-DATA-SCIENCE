import numpy as np

v1 = np.array([1,0])
v2 = np.array([2,0])

A = np.column_stack([v1, v2])# membuat matriks dengan vektor sebagai kolomnya
rank = np.linalg.matrix_rank(A)
print(rank) # Output: 1 (Artinya Dependen karena rank < 2)