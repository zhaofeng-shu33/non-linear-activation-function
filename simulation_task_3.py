# verify Up = (0, 0, \dots, 1)
N = 8
import numpy as np
import math
def delta(i, j):
    if (i + j) % 2 == 0:
        return 1
    return 0

def doublefactorial(n): 
  
    if (n == 0 or n == 1): 
        return 1; 
    return n * doublefactorial(n - 2)

if __name__ == '__main__':
    U = np.zeros([N,N])
    for i in range(0, N):
        for j in range(i, N):
            U[i, j] = (delta(i, j) * math.factorial(j)
            / (doublefactorial(j - i) * np.sqrt(math.factorial(i))))
    p = np.zeros(N)
    m = N - 1
    for i in range(0, N):
        if delta(i, m) == 0:
            continue
        p[i] = (delta(i, m) * np.power(-1.0, (m - i)/2.0)
            * np.sqrt(math.factorial(m))
            / (math.factorial(i) * doublefactorial(m - i)))
    print(p)
    print(U @ p)