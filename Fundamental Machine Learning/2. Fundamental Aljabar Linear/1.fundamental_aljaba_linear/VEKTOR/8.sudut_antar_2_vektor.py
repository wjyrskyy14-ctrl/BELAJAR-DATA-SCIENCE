import numpy as np
u = np.array([1.0, 0.0])
v = np.array([0.0, 1.0])

# Rumus di Python:
cos_theta = np.dot(u, v) / (np.linalg.norm(u) * np.linalg.norm(v))

theta = np.arccos(np.clip(cos_theta, -1, 1)) # Menggunakan np.clip untuk memastikan nilai berada dalam rentang [-1, 1]
sudut_derajat = np.degrees(theta) # Konversi dari radian ke derajat

print("nilai theta" , theta) # Output: 1.5707... 
print("nilai sudut dalam derajat:", sudut_derajat) # Output: 90.0 (Derajat)