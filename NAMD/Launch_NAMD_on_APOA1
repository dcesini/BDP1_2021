wget --no-check-certificate https://www.ks.uiuc.edu/Research/namd/utilities/apoa1.tar.gz
tar -xvzf apoa1.tar.gz
ll
cd apoa1/
export PATH=$PATH:/usr/lib64/openmpi/bin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/openmpi/lib/

####### Check that all libraries are resolved
ldd namd2
#############
#Keep the defaults
vim apoa1.namd
############

# Run with OPENMPI
# (if you are working as root (and you shouldn't) you need to add --allow-run-as-root to the mpirun command)
#In these examples namd2 and apoa1.namd are supposed to be in the same directory - i.e. copy the executable into the apoa1 dir)
cp ../namd2 .
mpirun -n 1 namd2 apoa1.namd
mpirun -n 2 namd2 apoa1.namd
mpirun -n 4 namd2 apoa1.namd
mpirun -n 6 namd2 apoa1.namd
mpirun -n 8 namd2 apoa1.namd
