import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt('solution_jacobi_omp.dat')
n = int(np.sqrt(data.shape[0]))
Z = data[:,2].reshape((n,n))

x = np.linspace(0, 1, n)
y = np.linspace(1, 0, n)
X, Y = np.meshgrid(x, y)

plt.contourf(X, Y, Z, levels=12)
plt.colorbar()
plt.title("2D Diffusion Equation")
plt.show()
