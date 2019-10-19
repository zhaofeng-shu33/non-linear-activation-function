# for fixed A, what is the eigenvalues of matrix M?
import numpy as np
from scipy.stats import ortho_group

def generate_M(n, k):
    X = ortho_group.rvs(n)[:,:k]
    A = X @ X.T
    A_sum = np.sum(A, axis=0)
    A_diag = np.diag(A)
    coeff_b_2 = n - np.sum(A)
    coeff_b = 2 * (k - np.dot(A_diag, A_sum)) / n
    coeff_const = (7 * np.sum(A_diag ** 2) - 6 * np.sum(A ** 3) - A_diag @ A @ A_diag.T ) / n**2
    return np.array([[coeff_const, coeff_b], [coeff_b, coeff_b_2]])

if __name__ == '__main__':
    for i in range(100):
        M = generate_M(4, 3)
        eig = np.linalg.eig(M)[0]
        if eig[0] < 0 or eig[1] < 0:
            print(M)