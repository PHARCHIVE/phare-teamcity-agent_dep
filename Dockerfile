ARG REGISTRY=registry.lpp.polytechnique.fr:5443
ARG RELEASE=40
FROM ${REGISTRY}/phare/teamcity-fedora:$RELEASE

ENV OMPI_ALLOW_RUN_AS_ROOT=1
ENV OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
ENV TMPDIR=/tmp
ENV MODULEPATH=/etc/scl/modulefiles:/etc/scl/modulefiles:/usr/share/Modules/modulefiles:/etc/modulefiles:/usr/share/modulefiles

WORKDIR /root
COPY run.sh /root
RUN chmod +x run.sh && ./run.sh
