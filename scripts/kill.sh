# Verifica se o número correto de argumentos foi passado
if [ $# -ne 1 ]; then
    echo "[DAA]: Utilize: $0 <ferramenta>"
    exit 1
fi

SERVICO=$1

# Buscando a aplicação para realizar o deploy
cd ../..
if [ -d "$SERVICO" ]; then 
    echo "[DAA]: Aplicação $SERVICO encontrada!"
    cd $SERVICO
    # Mata o serviço atual (caso esteja executando)
    docker compose down
    # Remove as imagens e os containers dos serviços que não estão sendo utilizados
    cd ../Docker-Applications-Automation/scripts && ./prune.sh
else
    echo "[DAA]: Erro! A aplicação $SERVICO não foi encontrada!"
    exit 1
fi