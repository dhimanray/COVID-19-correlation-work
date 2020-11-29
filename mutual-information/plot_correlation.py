#Plot the Linear Mutual Information based cross correlation Matrix

import numpy as np
import matplotlib.pyplot as plt

Iij = np.loadtxt('mutual_info.txt')

plt.figure(figsize=(11,10))
cb = plt.imshow(Iij,cmap='nipy_spectral_r')
plt.xlabel('Residue index',fontsize=24)
plt.ylabel('Residue index',fontsize=24)
plt.title('Mutual Information (Fully Open State)',fontsize=24)
xticks = [0,499,999,1499,1999,2499,2999,3437]
xlabels = np.asarray(xticks)+1
plt.xticks(ticks=xticks,labels=xlabels,fontsize=24)
plt.yticks(ticks=xticks,labels=xlabels,fontsize=24)
#ticks(fontsize=16)
cbar = plt.colorbar(cb,fraction=0.046, pad=0.04)
cbar.ax.tick_params(labelsize=20)
plt.savefig('mutual_information.png',dpi=100,bbox_inches='tight')
