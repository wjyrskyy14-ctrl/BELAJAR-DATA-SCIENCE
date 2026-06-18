import numpy as np

b1 = np.array([1, 0])
b2 = np.array([0, 2])
x = np.array([3, 4])

B = np.column_stack([b1, b2]) #menggabung dan membuat jadi matrix
coords = np.linalg.solve(B, x) # Fungsi solve jauh lebih stabil dari menghitung invers manual

print(coords) # Output: [3, 2]

#lebih simple
print( np.linalg.solve(B, x)) # Output: [3, 2]




