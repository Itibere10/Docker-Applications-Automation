# Verifica se o número correto de argumentos foi passado
if [ $# -ne 2 ]; then
    echo "[DAA]: Utilize: $0 <application> <user>"
    exit 1
fi

# Atribui os argumentos às variáveis correspondentes
APP=$1
USER=$2

echo "[DAA]: Realizando a remoção do repositório remoto (se existir)..."
gh auth refresh -h github.com -s delete_repo
gh repo delete $USER/$APP --yes
echo "[DAA]: Realizando a remoção do repositório local (se existir)..."
cd ../../
rm -rf $APP
echo "[DAA]: Realizando a remoção do container (se existir).."
docker rm $APP
echo "[DAA]: Realizando a remoção da imagem (se existir).."
docker rmi $APP