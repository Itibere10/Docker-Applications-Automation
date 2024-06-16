if [ $# -ne 3 ]; then
    echo "[ADA]: Utilize: $0 <name> <user> <key>"
    exit 1
fi

NAME=$1
USR=$2
TKN=$3

echo "[ADA]: Criando repositório Github para a aplicação $1..."
curl -u $USR:$TKN -d '{"name":'$NAME',"private":false}' https://api.github.com/user/repos
echo "[ADA]: Script de criação do repositório remoto finalizado!"