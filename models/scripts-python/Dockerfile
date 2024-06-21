# Instala o SO para executar os scripts Python
FROM alpine:latest

# Copia os arquivos dos scritps e requirements para dentro do container
COPY ./* /
RUN rm Dockerfile

# Faz a atualização dos pacotes e instala o Python 3
RUN apk update
RUN apk add python3
RUN apk add py3-pip

# Faz a instalação das bibliotecas python do requirements.txt
RUN pip3 install -r requirements.txt --break-system-packages

# Faz a instalação de pacotes independentes
#RUN apk add py3-scikit-learn

# Realiza a execução do script principal do Python
ENTRYPOINT ["python", "/main.py"]