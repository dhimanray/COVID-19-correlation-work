import numpy as np

disc = 1000 #first 6000 points (6 ns) to be discarded 
#these are restart trajectories generated after 5ns. So only 1 ns is discarded. 

for j in range(1,36):
    l = np.loadtxt('data/US_%d.colvars.traj'%j)
    l = l.T
    f1 = open('US_data/US_%d_data.dat'%j,'w')
    for i in range(disc,len(l[1])):
        print(l[0,i],l[1,i],file=f1)
    f1.close()
