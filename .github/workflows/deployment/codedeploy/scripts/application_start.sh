SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
ROOT_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd -P)"
source "$ROOT_DIR/deployment-config.env"

sudo docker run -d \
  --name $CONTAINER_NAME \
  -p 8080:8080 \
  -e SPRING_PROFILES_ACTIVE=$ENVIRONMENT \
  $IMAGE_URI

sleep 10

echo "✅ Application Start 완료"
