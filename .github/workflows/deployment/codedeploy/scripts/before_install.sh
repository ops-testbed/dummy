echo "Before Install: 배포 환경 준비"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
ROOT_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd -P)"
source "$ROOT_DIR/deployment-config.env"

echo "ECR 로그인"
aws ecr get-login-password --region $AWS_REGION | sudo docker login --username AWS --password-stdin $(echo $IMAGE_URI | cut -d'/' -f1)

echo "새 Docker 이미지 pull"
sudo docker pull $IMAGE_URI
