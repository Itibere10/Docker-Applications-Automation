# Verifica se o número correto de argumentos foi passado
if [ $# -ne 2 ]; then
    echo "[ADA]: Utilize: $0 <stop/kill/delete> <name>"
    exit 1
fi

# Atribui os argumentos às variáveis correspondentes
ACTION=$1
NAME=$2

# Checando se o container docker existe
if docker ps -a | grep -q "$NAME"; then
    
    # Caso exista:
    if [ $ACTION = "stop" ]; then 
        echo "[ADA] O container $NAME foi encontrado e será parado! Dando continuidade no processo..."
        # Executa a parada forçada do container
        docker kill $NAME
        echo "[ADA]: Script para parar o container $NAME finalizado!"
    elif [ $ACTION = "kill" ]; then
        echo "[ADA] O container $NAME foi encontrado e será morto (force stop)! Dando continuidade no processo..."
        # Executa a parada forçada do container
        docker kill $NAME
        echo "[ADA]: Script para matar o container $NAME finalizado!"
    elif [ $ACTION = "delete" ]; then
        echo "[ADA] O container $NAME foi encontrado e será deletado! Dando continuidade no processo..."
        # Executa a parada forçada do container
        docker rm $NAME
        echo "[ADA]: Script para deletar o container $NAME finalizado!"
    else
        echo "[ADA] Nenhuma ação correspondente!"
    fi
else
    # Caso não exista:
    echo "[ADA] O container $NAME não foi encontrado! Abortando o processo!"
fi