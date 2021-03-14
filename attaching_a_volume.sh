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
mount -a
df -h
ll /data2
chmod 775 /data2/
