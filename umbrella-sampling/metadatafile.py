
f1 = open('metadatafile.in','w')
for i in range(1,36):
    print('US_data/US_%d_data.dat'%i, float(i), 1.0, 250, file=f1)
#for i in range(1,21):
#    print('../US_new/US_data/US_%d_data.dat'%i, 26.+3.*(i-1), 0.25, file=f1)
f1.close()
