# Verifica se o número correto de argumentos foi passado

if [ $# -ne 3 ]; then
    echo "[DAA]: Utilize: $0 <type> <name> <local/github>"
    exit 1
fi

# Atribui os argumentos às variáveis correspondentes
TYPE=$1
NAME=$2
DESTINATION=$3

# Obtém o caminho do modelo
MODEL_PATH="$(./app_get_types.sh $TYPE)"

# Criação local
if [ "$DESTINATION" = "local" ]; then
    echo "[DAA]: Realizando a criação do repositório local para a aplicação $NAME..."
    mkdir -p ../../$NAME
    cp -r $MODEL_PATH ../../$NAME
    cd ../../$NAME
    echo "[DAA]: Repositório da aplicação $NAME criado com sucesso!"

# Criação remota + local
elif [ "$DESTINATION" = "github" ]; then
    echo "[DAA]: Realizando a criação do repositório remoto (Github) para a aplicação $NAME..."
    echo "[DAA]: O repositório também será clonado e sincronizado localmente..."
    STATUS="$(./app_repo_configs status)"
    ACCOUNT="$(./app_repo_configs account)"
    ./app_repo_create.sh $NAME $STATUS $ACCOUNT
    cp -r $MODEL_PATH ../../$NAME
    cd ../../$NAME
    git add .
    git status
    git commit -m "[DAA]: Criação inicial da aplicação $NAME"
    git push
    echo "[DAA]: Repositório da aplicação $NAME criado com sucesso!"

# Destino inválido
else
    echo "[DAA]: Destino de repositório inválido! Repositório para a aplicação $NAME não foi criado com sucesso!"
fi