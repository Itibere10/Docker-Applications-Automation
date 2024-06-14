# Verifica se o número correto de argumentos foi passado
if [ $# -ne 2 ]; then
    echo "[ADA]: Utilize: $0 <type> <name>"
    exit 1
fi

# Atribui os argumentos às variáveis correspondentes
TYPE=$1
NAME=$2

# Criando um modelo de aplicação em Frontend
if [ "$TYPE" = "frontend" ]; then
    echo "[ADA]: Realizando criação de Container de frontend..."
    cp -r ../models/frontend ../../$NAME
    echo "[ADA]: Diretório da aplicação $NAME criado com sucesso!"
    # Coloque aqui o código que deseja executar para frontend
elif [ "$TYPE" = "system" ]; then
    echo "[ADA]: Realizando criação de Container de sistema..."
    # Coloque aqui o código que deseja executar para system
    echo "[ADA]: Ainda não configurado!"
else
    echo "Tipo desconhecido: $TYPE"
    exit 1
fi