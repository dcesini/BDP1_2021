######### login to remote server #################################
ssh -i id_rsa_<surname> server_IP -l <surname>

#id_rsa_<surname> is your private key. The one that you received via email
# It is the file that does not contain the .pub extension
##################################################################



################ Trivial Search ##################################

cp /data/BDP1_2020/trivial/trivial_str_search.py .
cp /data/BDP1_2020/trivial/shining.txt.gz .
gunzip -l shining.txt.gz
gunzip shining.txt.gz
md5sum shining.txt
cat /data/BDP1_2020/trivial/md5_shining.txt
vim trivial_str_search.py
./trivial_str_search.py



###### BLAST   #######
######################

#################### already installed ############################################
ll /data/BDP1_2020/hg19/ncbi-blast-2.7.1+-1.x86_64.rpm
# you need to be root
yum localinstall ncbi-blast-2.7.1+-1.x86_64.rpm
###################################################################################

############## create the index for BLAST -  ALREADY DONE ##########################
makeblastdb -in entire_hg19.fa -out entire_hg19BLAST -dbtype nucl  -parse_seqids
##################################################################################
# INDEX is in /data/BDP1_2020/hg19/

ls -l /data/BDP1_2020/hg19/

########### get the query ###########################
cp /data/BDP1_2020/hg19/myread.fa .
#####################################################


############ run blast ########################################################
time blastn -db /data/BDP1_2020/hg19/entire_hg19BLAST -query myread.fa -out blast_myread.out
less blast_myread.out
###############################################################################


############### BWA #####################
#########################################

####### Install your own bwa ########################
cp /data/BDP1_2020/hg19/bwa-0.7.15.tar .
################## already installed ##########
yum install gcc gcc-c++
yum install zlib
yum install zlib-devel
###############################################
tar -xvf bwa-0.7.15.tar
cd bwa-0.7.15/
make 

# use your own bwa installation ###########
export PATH=$PATH:/yuor_path/bwa-0.7.15/
###########################################

############  BWA Istallation Completed #############################

##### bwa index creation - THIS IS ALREADY DONE ##########################
bwa index -p hg19bwaidx -a bwtsw entire_hg19.fa
##########################################################################
####### INDEX is in /data/BDP1_2020/hg19/ ###############################################

ls -ls /data/BDP1_2020/hg19/

cd ..  # back to home

# get the query ###########################
cp /data/BDP1_2020/hg19/myread.fa .
############################################

############## launch bwa ##################
bwa aln -t 1 /data/BDP1_2020/hg19/hg19bwaidx /your_path/myread.fa > myread.sai
bwa samse -n 10  /data/BDP1_2020/hg19/hg19bwaidx myread.sai myread.fa > myread.sam
less myread.sam
#####################################################################


################ READS LOCATION ####################################

ls -l  /data/BDP1_2020/hg19/reads/Patients

######################################################################
