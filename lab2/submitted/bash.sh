#!/bin/bash

echo "" > eval

for n in {1..19}
do
    cp ./tc/tc$n ./test.txt
    cp Outputs/true_out_$n ./true_out_$n

    ghdl -a -fsynopsys *.vhd
    ghdl -e -fsynopsys ASCII_Read_test
    ghdl -r -fsynopsys ASCII_Read_test --stop-time=10000ns

    diff -Bw true_out_$n out.txt &> /dev/null

    if [ $? -ne 0 ]; then
        echo $n wrong >> eval
    else
        echo $n >> eval
    fi
    
    
done
