BASEDIR=$(dirname "$0")
RELEASE=${1:-40}
REGISTRY=${2:-"registry.lpp.polytechnique.fr:5443"}
IMAGE="phare/teamcity-fedora_dep"
FULL_NAME="${REGISTRY}/${IMAGE}:${RELEASE}"
$BASEDIR/build_image.sh $RELEASE $REGISTRY
docker push $FULL_NAME
