# Verifica se o número correto de argumentos foi passado
if [ $# -ne 2 ]; then
    echo "[DAA]: Utilize: $0 <stop/kill/delete> <name>"
    exit 1
fi

# Atribui os argumentos às variáveis correspondentes
ACTION=$1
NAME=$2

# Checando se o container docker existe
if docker ps -a | grep -q "$NAME"; then
    
    # Caso exista:
    if [ $ACTION = "stop" ]; then 
        echo "[DAA] O container $NAME foi encontrado e será parado! Dando continuidade no processo..."
        # Executa a parada forçada do container
        docker kill $NAME
        echo "[DAA]: Script para parar o container $NAME finalizado!"
    elif [ $ACTION = "kill" ]; then
        echo "[DAA] O container $NAME foi encontrado e será morto (force stop)! Dando continuidade no processo..."
        # Executa a parada forçada do container
        docker kill $NAME
        echo "[DAA]: Script para matar o container $NAME finalizado!"
    elif [ $ACTION = "delete" ]; then
        echo "[DAA] O container $NAME foi encontrado e será deletado! Dando continuidade no processo..."
        # Executa a parada forçada do container
        docker rm $NAME
        echo "[DAA]: Script para deletar o container $NAME finalizado!"
    else
        echo "[DAA] Nenhuma ação correspondente!"
    fi
else
    # Caso não exista:
    echo "[DAA] O container $NAME não foi encontrado! Abortando o processo!"
fi