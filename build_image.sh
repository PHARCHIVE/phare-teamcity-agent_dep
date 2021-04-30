RELEASE=${1:-32}
REGISTRY=${2:-"129.104.6.165:32219"}
IMAGE="phare/teamcity-fedora_dep"
FULL_NAME="${REGISTRY}/${IMAGE}:${RELEASE}"
docker build --build-arg RELEASE=$RELEASE -t ${FULL_NAME} .
