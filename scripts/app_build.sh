# Verifica se o número correto de argumentos foi passado
if [ $# -ne 2 ]; then
    echo "[DAA]: Utilize: $0 <name> <tag>"
    exit 1
fi

# Atribui os argumentos às variáveis correspondentes
NAME=$1
TAG=$2

# Buscando a aplicação para realizar a build
cd ../..
if [ -d "$NAME" ]; then 
    echo "[DAA] Aplicação $NAME encontrada!"
    cd $NAME
    if [ -f Dockerfile ]; then 
        echo "[DAA] Dockerfile da aplicação $NAME encontrado! Realizando o build da imagem..."
        docker build -t $NAME:$TAG .
        echo "[DAA] Script de criação da aplicação $NAME finalizado!"
    else
        echo "[DAA] Erro! Dockerfile da aplicação $NAME não foi encontrado!"
        exit 1
    fi
else
    echo "[DAA] Erro! A aplicação $NAME não foi encontrada!"
    exit 1
fi