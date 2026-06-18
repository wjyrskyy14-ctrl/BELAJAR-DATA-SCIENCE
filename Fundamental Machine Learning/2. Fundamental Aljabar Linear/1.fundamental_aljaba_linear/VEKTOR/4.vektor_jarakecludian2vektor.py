import numpy as np

u = np.array([1, 0, 0])
v = np.array([0, 1, 0])

jarak = np.linalg.norm(u - v)
print(jarak) # outputnya 1.4142135623730951 
#              (karena sqrt((1-0)^2 + (0-1)^2 + (0-0)^2) = sqrt(2) = 1.4142135623730951)