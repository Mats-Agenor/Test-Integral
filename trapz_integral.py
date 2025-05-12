import time
import numpy as np
import matplotlib.pyplot as plt

# trapezoidal function
def f(x):
    return np.exp(-x) * np.cos(100 * x) * np.sqrt(x**3 + np.sin(x**2))

# Parâmetros da integral
a, b = 0, 100
N = 10**8  # points

start = time.time()

x = np.linspace(a, b, N)
h = (b - a) / (N - 1)
integral = (f(x[0]) + f(x[-1]) + 2 * np.sum(f(x[1:-1]))) * h / 2

end = time.time()

print(f"Result of integral: {integral}")
print(f"Teme of execution: {end - start:.2f} seconds")

# ---------- PLOT ----------
x_plot = np.linspace(0, 5, 1000)
y_plot = f(x_plot)

plt.figure(figsize=(10, 4))
plt.plot(x_plot, y_plot, label='f(x)', color='blue')
plt.xlabel('x')
plt.ylabel('f(x)')

plt.legend()
plt.tight_layout()
plt.savefig("function.png", dpi=300)
plt.show()

