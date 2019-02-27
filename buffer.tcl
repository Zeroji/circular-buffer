#!/usr/bin/env tclsh
source utils.tcl
variable size [lget $argv 0]
variable rindx 0
variable windx 0

set first yes
set OW no
foreach arg $argv {
    if {$first == no} {
        switch -glob $arg RE?D {
            if {$rindx < $windx} {
                puts [exec ./read.sh $rindx]
                incr rindx
                continue
            }
            else {
                exit 1
                break
            }
        } default {
            puts stderr "$windx $rindx $size"
            if {$windx-$rindx-$size>=0} {
                exit 2
                break
            }
            exec ./write.sh $windx $arg
            incr windx
            continue
        }
    }
    set first no
    continue
}