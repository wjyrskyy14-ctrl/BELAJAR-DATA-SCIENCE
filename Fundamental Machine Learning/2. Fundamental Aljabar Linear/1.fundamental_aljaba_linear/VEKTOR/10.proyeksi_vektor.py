import numpy as np

u = np.array([1, 2])
v = np.array([2, 0])

hitung= np.dot(u, v) / np.dot(v,v) * v
print(hitung) #output : [1.6 0. ]