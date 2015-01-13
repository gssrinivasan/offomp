#!/bin/bash
for nd in 1 2 3 4; do
export OMP_NUM_NVGPU_DEVICES=$nd
for size in 500000 1000000 2000000 3000000 4000000 5000000; do
echo "-------------------------------------------------------------------------------------------------"
echo "-------------------------------- AXPY ${size}, $nd devices ------------------------------"
./axpy-nvgpu $size
echo "-------------------------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------------------------"
done
done