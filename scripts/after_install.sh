#!/bin/bash
# Принудительно устанавливаем путь поиска бинарников
export PATH=$PATH:/usr/local/bin:/usr/bin

echo "Executing AfterInstall script..."

# Логин в ECR (аккаунт 004226106633)
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 004226106633.dkr.ecr.us-east-1.amazonaws.com

# Остановка старого контейнера
docker stop my-nodejs-app || true
docker rm my-nodejs-app || true

# Очистка и запуск нового
docker pull 004226106633.dkr.ecr.us-east-1.amazonaws.com/my-nodejs-app:latest
docker run -d --name my-nodejs-app -p 80:8080 004226106633.dkr.ecr.us-east-1.amazonaws.com/my-nodejs-app:latest

echo "Container is up and running."
