library(bio3d)

dcdfile <- "closed_80ns_CA_only.dcd"
pdbfile <- "spike_CA_only.pdb"

dcd <- read.dcd(dcdfile)
pdb <- read.pdb(pdbfile)

#print(pdb)

ca.inds <- atom.select(pdb, elety="CA")

xyz <- fit.xyz(fixed=pdb$xyz, mobile=dcd,
               fixed.inds=ca.inds$xyz,
               mobile.inds=ca.inds$xyz)

cij <- dccm(xyz[,ca.inds$xyz],method="lmi",ncore=8)

write.table(cij, file="mutual_info.txt", row.names=FALSE, col.names=FALSE)
