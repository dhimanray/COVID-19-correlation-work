#Example script for non-bonded energy analysis: residue Chain C: 112
#

mol new spike_dry.psf
mol addfile closed_80ns_US_3.dcd waitfor all

set sel1 [atomselect top "segname PROC and resid 112"]
set sel2 [atomselect top "protein and not (segname PROC and resid 112)"]
set execute /data/homezvol2/dray1/NAMD_2.13_Linux-x86_64-multicore/namd2

set prm1 toppar/par_all36m_prot.prm
set prm2 toppar/par_all36_carb.prm
set prm3 toppar/toppar_all36_carb_glycopeptide.str

set tempfile temp112
set outfile Energy_output_112
package require namdenergy
namdenergy -sel $sel1 $sel2 -exe $execute -par $prm1 -par $prm2 -par $prm3 -elec -vdw -tempname ${tempfile} -ofile ${outfile}
