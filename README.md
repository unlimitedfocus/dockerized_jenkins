# Dockerized Jenkins! 🚀

jenkins, mysql, target host

* Execute build commands
* Run servers


* [Installation](#-installation)
* [Usage](#️-usage)
* [Configuration](#️-configuration)
* [SSH keys & ssh connection]

## 💾 Installation

```
docker network create jenkinsnet
docker-compose build
```

## ▶️ Usage

```
docker-compose up
```

and open jenkins `http://localhost:8080`

id: admin
pw: admin

## ⚙️ Configuration

- jenkins workspace: jenkins_home/

## 📡 SSH keys & ssh connection

- id_rsa

```
ssh -i ./id_rsa root@127.0.0.1 -p 2222
```
