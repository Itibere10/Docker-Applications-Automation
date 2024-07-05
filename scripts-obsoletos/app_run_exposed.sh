# Verifica se o número correto de argumentos foi passado
if [ $# -ne 3 ]; then
    echo "[DAA]: Utilize: $0 <name> <version/tag> <port>"
    exit 1
fi

# Atribui os argumentos às variáveis correspondentes
NAME=$1
TAG=$2
PORT=$3

# Checando se a imagem docker existe
CHECK=$(docker images $NAME:$TAG)
if echo "$CHECK" | grep -q "$NAME"; then
    # Caso exista:
    echo "[DAA] A imagem $NAME:$TAG foi encontrada localmente! Dando continuidade no processo..."
    # Executa a exposição do Container no host
    echo "[DAA]: Realizando subida de um Container da aplicação $NAME utilizando a imagem $NAME:$TAG para a porta $PORT..."
    docker run -d -p $PORT:80 --name $NAME $NAME:$TAG
    echo "[DAA]: Script para subida da aplicação $NAME finalizado!"
else
    # Caso não exista:
    echo "[DAA] A imagem $NAME:$TAG não foi encontrada! Abortando o processo!"
fi