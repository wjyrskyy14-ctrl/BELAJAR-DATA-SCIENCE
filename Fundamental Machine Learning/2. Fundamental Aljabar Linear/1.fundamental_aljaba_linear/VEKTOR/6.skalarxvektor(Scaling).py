import numpy as np 

v = np.array([2, -1])
v_baru = -3 * v # Hasilnya: [-6, 3]

print("Panjang asli:", np.linalg.norm(v),'\n')      # Hasilnya: sqrt(2^2 + (-1)^2) = sqrt(5) ≈ 2.236
print("Panjang baru:", np.linalg.norm(v_baru)) # Hasilnya: sqrt((-6)^2 + 3^2) = sqrt(45) ≈ 6.708
# Terbukti 6.708 adalah 3 kali lipat dari 2.236!

#bisa juga gini biar simple untuk yg panjnagn baru
print(np.linalg.norm([-3 * v])) # Hasilnya: 6.708