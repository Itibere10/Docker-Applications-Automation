# Primeira fase: build da aplicação React
FROM node:lts-alpine as build

WORKDIR /app

# Copia o arquivo package.json para o diretório de trabalho
COPY /site/package.json ./
COPY /site/package-lock.json ./

# Instala as dependências
RUN npm install --production

# Copia o restante dos arquivos
COPY /site/. .

# Constrói a aplicação React para produção
RUN npm run build

# Segunda fase: prepara o servidor para servir os arquivos estáticos
FROM nginx:alpine

# Copia os arquivos de build da primeira fase para o servidor Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Expõe a porta 80 para tráfego HTTP
EXPOSE 80

# Comando para iniciar o servidor Nginx em primeiro plano
CMD ["nginx", "-g", "daemon off;"]
