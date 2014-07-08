
sudo apt-get install openssh-server
# logout and ssh in as root.
# run on one of the inf box: id
groupadd -g 99 nobody
usermod -u 1010 jwu
usermod -g 99 jwu
find / -user 1000 -exec chown -h 1010 {} \;
find / -group 1000 -exec chgrp -h 99 {} \;

# Mount NFS on mint
sudo apt install nfs-common
vi /etc/fstab
# Add line: 
# nas.upthere.com:/mnt/upthere/users /mnt/NFS nfs rw,rsize=8192,wsize=8192,timeo=14,intr,_netdev 0 0
mkdir /mnt/NFS
mount -a
sudo mkdir /home/users
sudo ln -s /mnt/NFS/jwu /home/users/jwu

# Install some basic libs.
sudo apt install emacs24
sudo apt-get install git
sudo apt-get install xterm
sudo apt-get install tk8.6
sudo apt-get install tmux
