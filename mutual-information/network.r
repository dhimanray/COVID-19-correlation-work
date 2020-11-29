library(bio3d)
library(igraph)

pdbfile <- "spike_CA_only.pdb"

pdb <- read.pdb(pdbfile)

#print(pdb)

#ca.inds <- atom.select(pdb, elety="CA")

#trj <- fit.xyz(fixed=pdb$xyz, mobile=dcd,
 #              fixed.inds=ca.inds$xyz,
  #             mobile.inds=ca.inds$xyz)

cij <- as.matrix(read.table("mutual_info.txt", sep=" "))

#cm <- cmap(trj, dcut = 5.0, scut = 0, pcut = 0.75, mask.lower = FALSE)


net <- cna(cij, cutoff.cij=0.6, cluster.method="btwn", collapse.method="max", ncore=8)

print("----------- Summary of Network--------------")
print(net)
print(summary(net))

print("----------- Modularity and Community--------------")
print(net$communities)

#tree <- community.tree(net, rescale=TRUE)
#write.table(tree$num.of.comms, file="num-communities.txt", row.names=FALSE, col.names=FALSE)
#write.table(tree$modularity, file="modularity.txt", row.names=FALSE, col.names=FALSE)

#pdf(file='communities.pdf',height=4,width=4)

#plot(net,pdb)
#dev.off()

node.betweenness <- betweenness(net$network)

b = normalize.vector(node.betweenness)
#round(b, digits=4)
write.table(b, file="centrality.txt", row.names=FALSE, col.names=FALSE)

#png(file='communities.png',res=200)

#plot(net,pdb)
#dev.off()

