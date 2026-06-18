import numpy as np

# 1.TRANSFORMASI

def T(v):
    # Bikin wadah kosong 3 baris 1 kolom (3D)
    w = np.zeros((3,1))
    w[0,0] = 3 * v[0,0]   # Mengisi baris pertama
    w[1,0] = 0            # Baris kedua otomatis tetap 0
    w[2,0] = -2 * v[1,0]  # Mengisi baris ketiga
    return w

v = np.array([[3], [5]])
w = T(v)

print("Original vector (2D):\n", v)
print("Result of transformation (3D):\n", w, '\n')
# Output: [[9.], [0.], [-10.]] -> Persis sama kayak hitungan manual kita!

# 2. PEMBUKTIAN SIFAT LINEAR

u = np.array([[1], [-2]])
v = np.array([[2], [4]])
k = 7

print('contoh pembuktian HOMOGEN')
print(T(k*v).eq(k*T(v))) # Output: True

print('contoh pembuktian ADITIF')
print(T(u+v).eq(T(u)+T(v))) # Output: True

# 3. TRANSFORMASI DI DEFINISIKAN SEBAGAI PERKALIAN MATRIKs 

def L(v):
    A = np.array([[3,0], [0,0], [0,-2]])
    print("Transformation matrix:\n", A, "\n")
    w = A @ v 
    
    return w

v = np.array([[3], [5]])
w = L(v)

print("Original vector:\n", v, "\n\n Result of the transformation:\n", w) # Output: [[9.], [0.], [-10.]] -> Persis sama kayak hitungan manual kita!

# 4.1 PENSKALAAN HORIZONTAL (DILATASI) melebar

def T_hscaling(v):
    A = np.array([[2,0], [0,1]])
    w = A @ v
    
    return w
    
    
def transform_vectors(T, v1, v2):
    V = np.hstack((v1.reshape(2,1), v2.reshape(2,1)))
    W = T(V)
    
    return W
    
e1 = np.array([[1], [0]])
e2 = np.array([[0], [1]])

transformation_result_hscaling = transform_vectors(T_hscaling, e1, e2)

print("Original vectors:\n e1= \n", e1, "\n e2=\n", e2, 
      "\n\n Result of the transformation (matrix form):\n", transformation_result_hscaling)

# 4.2 PENSKALAAN VERTIKAL refleksi

def T_reflection_yaxis(v):
    A = np.array([[-1,0], [0,1]])
    w = A @ v
    
    return w
    
e1 = np.array([[1], [0]])
e2 = np.array([[0], [1]])

transformation_result_reflection_yaxis = transform_vectors(T_reflection_yaxis, e1, e2)

print("Original vectors:\n e1= \n", e1,"\n e2=\n", e2, 
      "\n\n Result of the transformation (matrix form):\n", transformation_result_reflection_yaxis)