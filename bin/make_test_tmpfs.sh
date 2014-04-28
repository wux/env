
DIR=/tmp/_test_tmpfs
SIZE=2050M

set -x
mkdir $DIR
sudo mount -t tmpfs -o size=$SIZE,mode=777 tmpfs $DIR
set +x
