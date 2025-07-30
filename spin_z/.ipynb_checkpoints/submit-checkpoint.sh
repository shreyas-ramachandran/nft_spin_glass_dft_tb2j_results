#!/bin/bash

# Request 16 nodes (2048 MPI tasks at 128 tasks per node) for 20 minutes.   

#SBATCH --job-name=NFT_siesta
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH --cpus-per-task=1
#SBATCH --time=10:00:00

# Replace [budget code] below with your project code (e.g. t01)
#SBATCH --account=e89-ed_p
#
#SBATCH --partition=standard
#SBATCH --qos=standard

# Load the VASP module
module load other-software
module load spack
spack env activate -p /work/e89/e89/shreyas/siesta_env

# Avoid any unintentional OpenMP threading by setting OMP_NUM_THREADS
export OMP_NUM_THREADS=1

# Ensure the cpus-per-task option is propagated to srun commands
export SRUN_CPUS_PER_TASK=$SLURM_CPUS_PER_TASK

# Launch the code - the distribution and hint options are important for performance
srun --distribution=block:block --hint=nomultithread siesta <nft_bulk.fdf> nft_bulk.out
