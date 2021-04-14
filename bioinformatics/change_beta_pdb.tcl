proc listFromFile {filename} {
    set f [open $filename r]
    set data [split [string trim [read $f]]]
    close $f
    return $data
}

set pro [atomselect top "protein"]

set b [listFromFile consurf-scores-normalized.txt]
#puts $b

set Nres [llength $b]

#set Nchains 3

#set NresPerChain [expr $Nres/$Nchains ]

#for {set j 0} {$j < $Nchains} {incr j} {
set j 0
for {set i 0} {$i < $Nres} {incr i} {
	set sel [atomselect top "segname PROA and resid ${i}"]
	$sel set beta [lindex $b $j]
	
       	incr j
}

#for {set i 0} {$i < $NresPerChain} {incr i} {
#        set sel [atomselect top "segname PROB and resid ${i}"]
#        $sel set beta [lindex $b $j]
#        incr j
#}

#for {set i 0} {$i < $NresPerChain} {incr i} {
#        set sel [atomselect top "segname PROC and resid ${i}"]
#        $sel set beta [lindex $b $j]
#        incr j
#}

#set pro [atomselect top "protein"]
$pro writepdb chainA-consurf-normalized.pdb


	
