dnf install -y git openssl-devel

cd $HOME

git clone https://github.com/rui314/mold.git -b v1.0.1
(cd mold && make -j && make install)
rm -rf mold

eval `modulecmd bash load mpi/openmpi-x86_64`

git clone https://github.com/llnl/samrai -b develop samrai --recursive --depth 10
(
  cd samrai && mkdir build && cd build
  cmake .. \
  -DENABLE_OPENMP=OFF -DENABLE_TESTS=OFF -DENABLE_SAMRAI_TESTS=OFF \
  -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=true \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make -j && make install
)
rm -rf samrai

# SAMRAI doesn't find MPI for us anymore properly for some reason
ln -s /usr/lib64/openmpi/lib/libmpi_cxx.so /usr/local/lib64
ln -s /usr/lib64/openmpi/lib/libmpi_usempif08.so /usr/local/lib64
ln -s /usr/lib64/openmpi/lib/libmpi_usempi_ignore_tkr.so /usr/local/lib64
ln -s /usr/lib64/openmpi/lib/libmpi_mpifh.so /usr/local/lib64
ln -s /usr/lib64/openmpi/lib/libmpi.so /usr/local/lib64
