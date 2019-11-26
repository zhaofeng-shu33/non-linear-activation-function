# plot the function when n is odd
import numpy as np
from matplotlib import pyplot as plt
import math
MAX_N = 11
MAX_INTERVAL = 3
def doublefactorial(n): 
  
    if (n == 0 or n == 1): 
        return 1; 
    return n * doublefactorial(n - 2); 

def get_y(x_arr, m):
    scale_factor = np.sqrt(math.factorial(m))
    y_arr = np.zeros(x_arr.shape)
    for i in range(1, m + 1, 2):
        y_arr += np.power(x_arr, i) * np.power(-1, (m - i)/2) / (math.factorial(i) * doublefactorial(m - i))
    y_arr *= scale_factor
    if(y_arr[50 * MAX_INTERVAL + 2] < 0):
        y_arr = - y_arr
    return y_arr
if __name__ == '__main__':
    x = np.linspace(-MAX_INTERVAL, MAX_INTERVAL, 100 * MAX_INTERVAL)
    for m in range(3, MAX_N + 1, 2):
        y = get_y(x, m)
        plt.plot(x, y, label='%d' % m)
    plt.legend()
    plt.show()