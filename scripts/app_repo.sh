USR='itibere10'
TKN='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'

if [ $# -ne 1 ]; then
    echo "[ADA]: Utilize: $0 <name> "
    exit 1
fi

echo "[ADA]: Criando repositório Github para a aplicação $1..."
curl -u $USR:$TKN -d '{"name":'$1',"private":false}' https://api.github.com/user/repos
echo "[ADA]: Script de criação do repositório remoto finalizado!"