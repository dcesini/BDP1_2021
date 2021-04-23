df -h
fdisk -l
fdisk /dev/xvdf    #use your disk label obtained by the previous command

######## PAY ATTENTION AND AVOID FORMATTING THE SYSTEM DISK!!!!!!!!!!
# fdisk commands: p, n (primary partition and use the defaults), p, w
mkfs.ext4 /dev/xvdf1
mkdir /data2
yum install vim
vim /etc/fstab
# add the line: /dev/xvdf1     /data2  ext4 defaults 0 0

###############################
#Inspect the fstaba file
[root@ip-172-31-12-71 ~]# cat /etc/fstab

#
# /etc/fstab
# Created by anaconda on Mon Jan 28 15:24:25 2019
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
UUID=4a1c93d9-eb47-4f96-9f3d-920e52dc8cca /                       xfs     defaults        0 0
/dev/xvdf1     /data2  ext4 defaults 0 0
##########################################################

df -h
mount -a
df -h   #check the differences
ll /data2
chmod 775 /data2/
