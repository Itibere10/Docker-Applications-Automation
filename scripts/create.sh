if [ "$#" -lt 2 ]; then
    echo "Uso: $0 <application_name> <model1> [<model2> <model3> ...]"
    exit 1
fi

MODELS_PATH="../models"
APP_NAME=$1
DIR=$(pwd)

cd ../..
if [ -d "$APP_NAME" ]; then
    echo "[DAA]: Erro! O diretório/aplicação $APP_NAME já existe!"
    exit 1
fi
cd $DIR

echo "[DAA]: Criando Compose.yaml da aplicação $APP_NAME..."
cat << EOF > "Compose.yaml"
name: $APP_NAME

services:

volumes:
EOF

# Loop para verificar cada argumento a partir do segundo
for ((i = 2; i <= $#; i++)); do
    # Captura o argumento atual
    ARG="${!i}"

    # Verifica se é um arquivo .yaml dentro do diretório models/
    if [ -f "$MODELS_PATH/$ARG.yaml" ]; then
        echo -e "\n[DAA]: Modelo $ARG.yaml encontrado!"

        echo "[DAA]: Vasculhando pelo serviço $ARG..."
        START_MARKER="###### start-service-$ARG"
        END_MARKER="###### end-service-$ARG"
        sed -n "/$START_MARKER/,/$END_MARKER/p" "$MODELS_PATH/$ARG.yaml" > "temp.yaml"
        sed -i "/services:/r temp.yaml" Compose.yaml
        rm temp.yaml

        echo "[DAA]: Vasculhando pelos volumes de $ARG..."
        START_MARKER="###### start-volumes-$ARG"
        END_MARKER="###### end-volumes-$ARG"
        sed -n "/$START_MARKER/,/$END_MARKER/p" "$MODELS_PATH/$ARG.yaml" > "temp.yaml"
        sed -e '$s/$/\n/' -e '$r temp.yaml' Compose.yaml > Compose_temp.yaml && mv Compose_temp.yaml Compose.yaml

        rm temp.yaml

        echo "[DAA]: Otimizando arquivo de Compose.yaml..."
        sed -i 's/^######.*/ /g' Compose.yaml
        sed -i -zE 's/([ \t\f\v\r]*\n){3,}/\n\n/g' Compose.yaml

        echo "[DAA]: Servico $ARG adicionado à Stack da aplicação!"

    else
        echo "[DAA]: Erro! O modelo $ARG.yaml não foi encontrado!"
        exit 1
    fi
done

echo -e ""
echo "[DAA]: Realizando a criação do repositório local para a aplicação $APP_NAME..."
mkdir -p ../../$APP_NAME
cp -r Compose.yaml ../../$APP_NAME/
rm Compose.yaml
echo "[DAA]: Repositório da aplicação $APP_NAME criado com sucesso!"

echo -e ""
echo "[DAA]: Buscando e adicionando arquivos necessários para os aplicativos..."

for ((i = 2; i <= $#; i++)); do
    ARG="${!i}"
    cp -r $MODELS_PATH/$ARG-* ../../$APP_NAME
done

cd ../../$APP_NAME
echo -e "\n[DAA]: Aplicação $APP_NAME criada!"