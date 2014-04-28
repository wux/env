BUILD_DIR=/home/users/jwu/p4/build_opt
SRC_DIR=/home/users/jwu/p4/src

# exit on error.
set -e

pushd $BUILD_DIR

echo "************************"
echo " Release test"
echo "************************"
cmake -DCMAKE_BUILD_TYPE=Release --debugoutput $SRC_DIR
make -j8
make test

popd

