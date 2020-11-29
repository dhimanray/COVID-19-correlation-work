import numpy as np
import matplotlib.pyplot as plt

for i in range(1,36):
    l = np.loadtxt('US_data/US_%d_data.dat'%i)
    l = l.T
    hist, bin_edges = np.histogram(l[1],bins=20,density=True) #,label='dist-%d'%i)
    plt.plot(bin_edges[1:], hist,label='dist-%d'%i)

plt.xlabel('RBD deviation ($\AA$)',size=22)
plt.ylabel('Probability density',size=22)
plt.xticks(fontsize=18)
plt.yticks(fontsize=18)
plt.tight_layout()
plt.show()
