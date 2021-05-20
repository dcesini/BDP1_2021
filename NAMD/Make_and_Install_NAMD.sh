########## compile and install namd2 2.13 #####################
 
########      MPI version with OPENMPI    ###################
 
yum install openmpi-devel.x86_64
yum install csh
yum install gcc-c++
 
export PATH=$PATH:/usr/lib64/openmpi/bin/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/openmpi/lib/
 
 
##################################################
# Install NAMD from Source
#####################################################
# Unpack NAMD and matching Charm++ source code and enter directory:
#Download namd source code from https://www.ks.uiuc.edu/Research/namd/ (registration needed)
  tar xzf NAMD_2.13_Source.tar.gz
  cd NAMD_2.13_Source
  tar xf charm-6.8.2.tar
  cd charm-6.8.2
 
## Build and test the Charm++/Converse library (MPI version):
  env MPICXX=mpicxx ./build charm++ mpi-linux-x86_64 --with-production
  cd mpi-linux-x86_64/tests/charm++/megatest
  make pgm
  mpirun -n 4 ./pgm    (run as any other MPI program on your cluster)
  cd ../../../../..
 
#Download and install TCL and FFTW libraries:
#  (cd to NAMD_2.13_Source if you're not already there)
wget http://www.ks.uiuc.edu/Research/namd/libraries/fftw-linux-x86_64.tar.gz
wget http://www.ks.uiuc.edu/Research/namd/libraries/tcl8.5.9-linux-x86_64.tar.gz
wget http://www.ks.uiuc.edu/Research/namd/libraries/tcl8.5.9-linux-x86_64-threaded.tar.gz
 
  tar xzf fftw-linux-x86_64.tar.gz
  mv linux-x86_64 fftw
  tar xzf tcl8.5.9-linux-x86_64.tar.gz
  tar xzf tcl8.5.9-linux-x86_64-threaded.tar.gz
  mv tcl8.5.9-linux-x86_64 tcl
  mv tcl8.5.9-linux-x86_64-threaded tcl-threaded
 
#Optionally edit various configuration files:
#  (not needed if charm-6.8.2, fftw, and tcl are in NAMD_2.13_Source)
 
  vi Make.charm  (set CHARMBASE to full path to charm)
  vi arch/Linux-x86_64.fftw     (fix library name and path to files)
  vi arch/Linux-x86_64.tcl      (fix library version and path to TCL files)
###################################################
 
#   Set up build directory and compile:
 
# per   MPI version:
  ./config Linux-x86_64-g++ --charm-arch mpi-linux-x86_64
  cd Linux-x86_64-g++
  make  
# (or gmake -j 8, which should run faster)
