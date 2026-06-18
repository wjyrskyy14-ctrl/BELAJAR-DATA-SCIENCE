import numpy as np

v = np.array([3, 4])

v_hat = v / np.linalg.norm(v)
print(v_hat) #output : [0.6 0.8]