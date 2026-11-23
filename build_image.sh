RELEASE=${1:-40}
REGISTRY=${2:-"registry.lpp.polytechnique.fr:5443"}
IMAGE="phare/teamcity-fedora_dep"
FULL_NAME="${REGISTRY}/${IMAGE}:${RELEASE}"
docker build --build-arg RELEASE=$RELEASE --build-arg REGISTRY=$REGISTRY -t ${FULL_NAME} .
