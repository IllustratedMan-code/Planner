#!/usr/bin/env bash

function tainted_state(){
    echo $(($(cat /proc/sys/kernel/tainted)>>($1)&1))
}

problems=( "G/P: proprietary module was loaded"
           "F: module was force loaded"
           "S: kernel running on an out of specification system"
           "R: module was force unloaded"
           "M: processor reported a Machine Check Exception (MCE)"
           "B: bad page referenced or some unexpected page flags"
           "U: taint requested by userspace application"
           "D: kernel died recently, i.e. there was an OOPS or BUG"
           "A: ACPI table overridden by user"
           "W: kernel issued warning"
           "C: staging driver was loaded"
           "I: workaround for bug in platform firmware applied"
           "O: externally-built (out-of-tree) module was loaded"
           "E: unsigned module was loaded"
           "L: soft lockup occurred"
           "K: kernel has been live patched"
           "X: Auxiliary taint, defined for and used by distros"
           "T: kernel was built with the struct randomization plugin"
           "N: an in-kernel test has been run"
         )
for i in {0..18}
do
    if [[ $(tainted_state $i) == "1" ]]; then
        echo ${problems[$i]}
    fi
done
