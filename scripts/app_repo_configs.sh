if [ $# -ne 1 ]; then
    echo "[DAA]: Utilize: $0 <status/account>"
    exit 1
fi

PARAM=$1

# Caso a configuração a ser obtida seja o usuário/conta do Github
if [ "$PARAM" = "account" ]; then
    echo "Digite o nome de usuário da conta (Github):"
    read USUARIO
    echo "$USUARIO"
# Caso a configuração a ser obtida seja o status para o repositório a ser criado (public/private)
elif [ "$PARAM" = "status" ]; then
    echo "Digite a exibição do repositório (public ou private): "
    read STATUS
    if [ "$STATUS" != "public" ] && [ "$STATUS" != "private" ]; then
        echo "[DAA]: Erro! Visibilidade do repositório inválida!"
    else
        echo "$STATUS"
    fi
fi

