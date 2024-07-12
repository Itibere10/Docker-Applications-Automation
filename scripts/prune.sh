# Realiza o prune de todos os recursos que não estão sendo utilizados
docker image prune -a --force
docker container prune --force
docker builder prune -a --force
docker volume prune -a --force
docker network prune --force
echo "[DAA]: Prune realizado!"