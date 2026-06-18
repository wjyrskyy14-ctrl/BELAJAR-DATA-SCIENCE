import numpy as np

p = np.array([1,2,3])
q = np.array([3,4,6])

d = q-p
x_t = p + 0.5*d
print(x_t) # Output: [2. 3. 4.5]