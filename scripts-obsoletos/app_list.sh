# Listando aplicações containerizadas criadas
echo -e "\n[DAA]: Aplicações containerizadas criadas (ativas e inativas):"
docker ps -a
# Listando imagens criadas
echo -e "\n[DAA]: Imagens de aplicações construidas:"
docker images
echo -e "\n"