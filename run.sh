# Entra no diretório dos scripts
cd scripts/

# Opções de manipulação das aplicações
if [ $# -ne 1 ]; then
    echo "[DAA]: Utilize: $0 <create/build/publish/run/stop/clear/list/help>"
    exit 1
fi
ACTION=$1

# Criar uma aplicação
if [ $ACTION = "create" ]; then
    echo "[DAA]: Digite o tipo de aplicação:"
    read TIPO
    echo "[DAA]: Digite o nome da aplicação:"
    read NOME
    ./app_create.sh $TIPO $NOME

# Realizando o build/construção de uma imagem da aplicação
elif [ $ACTION = "build" ]; then
    echo "[DAA]: Digite o nome da aplicação:"
    read NOME
    echo "[DAA]: Digite a tag para a imagem da aplicação:"
    read TAG
    ./app_build.sh $NOME $TAG

# Realizando a publicação de uma imagem no GitHub
elif [ $ACTION = "publish" ]; then
    echo "[DAA]: Digite o nome da aplicação (ou nome do repositório local):"
    read NOME
    echo "[DAA]: Informe se o repositório será público ou privado (public ou private):"
    read STATUS
    echo "[DAA]: Informe a o nome de usuário/conta do Github (precisa estar autenticado na CLI):"
    read CONTA
    ./app_publish.sh $NOME $STATUS $CONTA

# Realizando a execução/subida de um container da aplicação
elif [ $ACTION = "run" ]; then
    echo "[DAA]: Digite o nome da aplicação:"
    read NOME
    echo "[DAA]: Digite a TAG da aplicação que irá ser executada:"
    read TAG
    echo "[DAA]: Em qual modo a aplicação irá ser executada?"
    echo "[DAA]: Digite o escolhido entre exposed, iteractive ou process"
    read MODO
    if [ $MODO = "exposed" ]; then
        echo "[DAA]: Digite a porta/port para expor a aplicação:"
        read PORTA
        ./app_run_exposed.sh $NOME $TAG $PORTA
    elif [ $MODO = "iteractive" ]; then
        ./app_run_iteractive.sh $NOME $TAG
    elif [ $MODO = "process" ]; then
        ./app_run_process.sh $NOME $TAG
    else
        echo "[DAA]: Modo de execução inválido!"
        exit 1
    fi

# Realizando a parada de uma aplicação/container ativo
elif [ $ACTION = "stop" ]; then
    echo "[DAA]: Digite o nome da aplicação:"
    read NOME
    echo "[DAA]: Informe a ação a ser executada (stop, kill ou delete)"
    read ACAO
    ./app_stop.sh $ACAO $NOME

# Realizando a exclusão geral de uma aplicação
elif [ $ACTION = "clear" ]; then
    echo "[DAA]: Digite o nome da aplicação:"
    read NOME
    echo "[DAA]: Informe o usuário/conta do Github que a aplicação esteja (ou possa estar) criada:"
    read USUARIO
    ./app_clear.sh $NOME $USUARIO

# Executa uma busca por aplicações ativas (no Docker)
elif [ $ACTION = "list" ]; then
    ./app_list.sh

# Executa uma busca por aplicações ativas (no Docker)
elif [ $ACTION = "help" ]; then
    echo "[DAA]: Ajuda em construção!"
    #./app_help.sh

# Opção inválida
else
    echo "[DAA]: Opção de ação inválida!"
    exit 1
fi