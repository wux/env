BUILD_DIR=/home/users/jwu/p4/build
SRC_DIR=/home/users/jwu/p4/src

# exit on error.
set -e

pushd $BUILD_DIR

echo "************************"
echo " Debug test "
echo "************************"
cmake -DCMAKE_BUILD_TYPE=Debug --debugoutput $SRC_DIR
make -j8
# only test storage for now.
pushd storage
make test

popd
