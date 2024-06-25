# Carrega a imagem latest do Prometheus
FROM prom/prometheus

# Atualiza o arquivo de configurações pelo do diretório
COPY prometheus.yaml /etc/prometheus/prometheus.yml 

# Expõe a porta do container
EXPOSE 80

# Passa os parâmetros de configurações iniciais do Prometheus
CMD ["--config.file=/etc/prometheus/prometheus.yml", "--web.listen-address=:80"]