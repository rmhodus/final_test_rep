#!/bin/bash
# 1. Авторизация в ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 004226106633.dkr.ecr.us-east-1.amazonaws.com

# 2. Остановка и удаление старого контейнера (если он есть)
docker stop my-nodejs-app || true
docker rm my-nodejs-app || true

# 3. Удаление старых образов для экономии места
docker system prune -af

# 4. Запуск нового контейнера
docker run -d --name my-nodejs-app -p 80:8080 004226106633.dkr.ecr.us-east-1.amazonaws.com/my-nodejs-app:latest
