# Verifica se o número correto de argumentos foi passado
if [ $# -ne 4 ]; then
    echo "[DAA]: Utilize: $0 <type> <name> <public/private> <user/account>"
    exit 1
fi

# Atribui os argumentos às variáveis correspondentes
TYPE=$1
NAME=$2
STATUS=$3
ACCOUNT=$4
MODEL_PATH=""

# Criando um modelo de aplicação em Frontend
if [ "$TYPE" = "frontend-simple" ]; then
    echo "[DAA]: Realizando a criação da aplicação de frontend simples..."
    MODEL_PATH="../models/frontend-simple/*"
elif [ "$TYPE" = "frontend-react" ]; then
    echo "[DAA]: Realizando a criação da aplicação de frontend com react..."
    MODEL_PATH="../models/frontend-react/*"
else
    echo "Tipo desconhecido: $TYPE"
    exit 1
fi

# Realizando Atualização do repositório com os padrões esperados
./app_repo.sh $NAME $STATUS $ACCOUNT
cp -r $MODEL_PATH ../../$NAME
cd ../../$NAME
git add .
git status
git commit -m "[DAA]: Criação inicial da aplicação $NAME"
git push
echo "[DAA]: Repositório da aplicação $NAME criado com sucesso!"