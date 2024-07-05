# Verifica se o número correto de argumentos foi passado
if [ $# -ne 2 ]; then
    echo "[DAA]: Utilize: $0 <name> <version/tag>"
    exit 1
fi

# Atribui os argumentos às variáveis correspondentes
NAME=$1
TAG=$2

# Checando se a imagem docker existe
CHECK=$(docker images $NAME:$TAG)
if echo "$CHECK" | grep -q "$NAME"; then
    # Caso exista:
    echo "[DAA] A imagem $NAME:$TAG foi encontrada localmente! Dando continuidade no processo..."
    # Executa a exposição do Container no host
    echo "[DAA]: Realizando subida de um Container da aplicação $NAME utilizando a imagem $NAME:$TAG em modo iterativo."
    docker run --name $NAME $NAME:$TAG
    docker rm $NAME
    echo "[DAA]: Interação via terminal da $NAME finalizada!"
else
    # Caso não exista:
    echo "[DAA] A imagem $NAME:$TAG não foi encontrada! Abortando o processo!"
fi