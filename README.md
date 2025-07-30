# SIESTA Input files and TB2J outputs
The repository containes the input files and results of the DFT calculations performed using SIESTA, as well as the TB2J outputs from the DFT calculations.

The "struc_opt" folder contains the inputs and outputs of the structural relaxation using the Conjugate Gradient approach. The relaxed lattice parameters and coordinates are subsequently used in the single-point calculations contained in the folders "spin_x", "spin_y" and "spin_z". Each of the folders has the global spin axis aligned along the x, y and z axes respectively. The exchange parameters are obtained using TB2J in each of the folders, and the combined together using TB2J_merge.py with the y-axis being the reference structure.
