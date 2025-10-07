SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
ROOT_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd -P)"
source "$ROOT_DIR/deployment-config.env"

# 기존 컨테이너 중지 및 제거
if sudo docker ps -q --filter "name=$CONTAINER_NAME" | grep -q .; then
  echo "기존 컨테이너 중지 중: $CONTAINER_NAME"
  sudo docker stop $CONTAINER_NAME || true
  sudo docker rm $CONTAINER_NAME || true
else
  echo "실행 중인 컨테이너가 없습니다: $CONTAINER_NAME"
fi

# 사용하지 않는 이미지 정리
sudo docker image prune -f || true

echo "✅ Application Stop 완료"
