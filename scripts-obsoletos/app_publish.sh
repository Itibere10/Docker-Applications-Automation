if [ $# -ne 3 ]; then
    echo "[DAA]: Utilize: $0 <name/local repository> <public/private> <Github User/Account>"
    exit 1
fi

NAME=$1
STATUS=$2
ACCOUNT=$3

if [ "$STATUS" != "public" ] && [ "$STATUS" != "private" ]; then
    echo "[DAA]: Erro! Visibilidade do repositório inválida!"
    exit 1
fi

# Realizando a criação do repositório remoto
echo "[DAA]: Realizando a criação do repositório remoto (Github) para a aplicação $NAME..."

if [ ! -d "../../$NAME" ]; then
    echo "[DAA]: Diretório da aplicação não foi encontrado! Criação cancelada."
    exit 1
else
    cd ../../$NAME
    git init
    git add .
    git status
    git commit -m "[DAA]: Criação inicial da aplicação $NAME"
    git remote add origin https://github.com/$ACCOUNT/$NAME.git
    gh repo create $NAME --$STATUS
    git push --set-upstream origin master
    echo "[DAA]: Repositório remoto da aplicação $NAME criado com sucesso!"
fi