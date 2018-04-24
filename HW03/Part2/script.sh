#! /bin/bash

#PBS -l walltime=00:10:00
#PBS -l nodes=1:ppn=20
#PBS -W group_list=newriver
#PBS -q open_q
#PBS -A CMDA3634SP18
#PBS -j oe

cd $PBS_O_WORKDIR

module purge
module load gcc
module load openmpi

make

for num in 'seq 1 20'
do
	mpiexec -n $num main;
done;
