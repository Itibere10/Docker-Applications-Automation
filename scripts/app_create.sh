# Verifica se o número correto de argumentos foi passado

if [ $# -ne 2 ]; then
    echo "[DAA]: Utilize: $0 <type> <name>"
    exit 1
fi

# Atribui os argumentos às variáveis correspondentes
TYPE=$1
NAME=$2

# Obtém o caminho do modelo
MODEL_PATH="$(./app_get_types.sh $TYPE)"

# Criação local da aplicação
echo "[DAA]: Realizando a criação do repositório local para a aplicação $NAME..."
mkdir -p ../../$NAME
cp -r $MODEL_PATH ../../$NAME
cd ../../$NAME
echo "[DAA]: Repositório da aplicação $NAME criado com sucesso!"