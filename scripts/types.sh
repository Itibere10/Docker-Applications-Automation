if [ $# -ne 1 ]; then
    echo "[DAA]: Utilize: $0 <type>"
    exit 1
fi

TYPE=$1

# Frontend Simples
if [ "$TYPE" = "frontend-vanilla" ]; then
    MODEL_PATH="../models/frontend-vanilla/*"

# Frontend com React
elif [ "$TYPE" = "frontend-react" ]; then
    MODEL_PATH="../models/frontend-react/*"

# Script em Python
elif [ "$TYPE" = "scripts-python" ]; then
    MODEL_PATH="../models/scripts-python/*"

# API com Flask (Python)
elif [ "$TYPE" = "api-flask" ]; then
    MODEL_PATH="../models/api-flask/*"

# Monitoramento com Prometheus
elif [ "$TYPE" = "monitoring-prometheus" ]; then
    MODEL_PATH="../models/monitoring-prometheus/*"

# Nenhuma das acima
else
    echo "Tipo desconhecido: $TYPE"
    exit 1
fi

echo "$MODEL_PATH"

