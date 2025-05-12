import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt("function_data_F90.dat")
x, y = data[:, 0], data[:, 1]

plt.figure(figsize=(10, 4))
plt.plot(x, y, label='f(x)', color='red')

plt.xlabel('x')
plt.ylabel('f(x)')

plt.legend()
plt.tight_layout()
plt.savefig("funcao_integranda_fortran.png", dpi=300)
plt.show()

