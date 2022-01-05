ARG RELEASE=35
FROM 129.104.6.165:32219/phare/teamcity-fedora:$RELEASE

ENV OMPI_ALLOW_RUN_AS_ROOT=1
ENV OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
ENV TMPDIR=/tmp
ENV MODULEPATH=/etc/scl/modulefiles:/etc/scl/modulefiles:/usr/share/Modules/modulefiles:/etc/modulefiles:/usr/share/modulefiles


RUN dnf install -y git openssl-devel && \
    cd $HOME && git clone https://github.com/rui314/mold.git -b v1.0.1 && \
    cd mold && make -j && make install && cd .. && rm -rf mold

RUN eval `modulecmd bash load mpi/openmpi-x86_64` && \
    git clone https://github.com/llnl/samrai -b master samrai --recursive --depth 10 && \
    cd samrai && mkdir build && cd build && \
    cmake .. \
      -DENABLE_OPENMP=OFF -DENABLE_TESTS=OFF -DENABLE_SAMRAI_TESTS=OFF \
      -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=true \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo && \
    make -j && make install && cd ../.. && rm -rf samrai

