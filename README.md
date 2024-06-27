# Docker Applications Automation

Repositório para armazenar modelos e scripts para as criações automatizadas de aplicações containerizadas.

## Instalação de ferramentas necessárias
As ferramentas que você irá precisar para executar a aplicação são o **Git** (para Git e Git Bash), a **Github CLI** e o **Docker** (para comandos Docker, então podem ser alternativas, como WSL, Rancher Desktop, etc).

Instalando com o **Chocolatey:**
``` bash
choco install gh git docker-desktop -r -y
```
## Obtendo a aplicação
Para executar a aplicação na sua máquina local, clone o repositório para a sua máquina utilizando **SSH**:
``` bash
git clone git@github.com:Itibere10/Docker-Applications-Automation.git
```
Clone utilizando **HTTPS**:
``` bash
git clone https://github.com/Itibere10/Docker-Applications-Automation.git
```
Clone utilizando a **Github CLI**:
``` bash
gh repo clone Itibere10/Docker-Applications-Automation
```
## Utilizando a aplicação
Para utilizar a aplicação, entre no diretório da mesma e execute o seguinte comando:
``` bash
./run.sh
```
