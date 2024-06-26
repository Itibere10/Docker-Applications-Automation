if [ $# -ne 3 ]; then
    echo "[DAA]: Utilize: $0 <name> <public/private> <user/account>"
    exit 1
fi

NAME=$1
STATUS=$2
ACCOUNT=$3

if [ "$STATUS" != "public" ] && [ "$STATUS" != "private" ]; then
    echo "[DAA]: Erro! Visibilidade do repositório inválida!"
else
    echo "[DAA]: Criando repositório Github para a aplicação $NAME..."
    gh repo create $NAME --$STATUS
    cd ../../
    gh repo clone $ACCOUNT/$NAME
    echo "[DAA]: Script de criação do repositório remoto finalizado!"
fi