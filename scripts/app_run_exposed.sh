# Verifica se o número correto de argumentos foi passado
if [ $# -ne 3 ]; then
    echo "[ADA]: Utilize: $0 <name> <version/tag> <port>"
    exit 1
fi

# Atribui os argumentos às variáveis correspondentes
NAME=$1
TAG=$2
PORT=$3

# Checando se a imagem docker existe
CHECK=$(docker images $NAME:$TAG)

if echo "$CHECK" | grep -q "$NAME"; then
#if docker images $NAME_AND_TAG | grep -e -s -- $NAME_AND_TAG; then
    # Caso exista:
    echo "[ADA] A imagem $NAME:$TAG foi encontrada localmente! Dando continuidade no processo..."

    # Executa a exposição do Container no host
    echo "[ADA]: Realizando subida de um Container da aplicação $NAME utilizando a imagem $NAME:$TAG para a porta $PORT..."
    docker run -d -p $PORT:80 --name $NAME $NAME:$TAG
    echo "[ADA]: Script para subida da aplicação $NAME finalizado!"
else
    # Caso não exista:
    echo "[ADA] A imagem $NAME:$TAG não foi encontrada! Abortando o processo!"
fi