# Verifica se o número correto de argumentos foi passado
if [ $# -ne 2 ]; then
    echo "[ADA]: Utilize: $0 <name> <tag>"
    exit 1
fi

# Atribui os argumentos às variáveis correspondentes
NAME=$1
TAG=$2

# Buscando a aplicação para realizar a build
cd ../..
if [ -d "$NAME" ]; then 
    echo "[ADA] Aplicação $NAME encontrada! Realizando o build da imagem..."
    cd $NAME
    docker build -t $NAME:$TAG .
    echo "[ADA] Script de criação da aplicação $NAME finalizado!"
else
    echo "[ADA] Erro! A aplicação $NAME não foi encontrada!"
fi