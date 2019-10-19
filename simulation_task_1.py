# for fixed A, what is the eigenvalues of matrix M?
import numpy as np
from scipy.stats import ortho_graph

def generate_M(n, k):
    X = ortho_group.rvs(n)[:,:k]
    A = X @ X.T
    A_sum = np.sum(A, axis=0)
    A_diag = np.diag(A)
    coeff_b_2 = n - np.sum(A)
    coeff_b = 2 * (k - np.dot(A_diag, A_sum)) / n
    coeff_const = 0
    return np.array([[coeff_const, coeff_b], [coeff_b, coeff_b_2]])

if __name__ == '__main__':
    generate_M(3, 2)