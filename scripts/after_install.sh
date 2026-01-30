#!/bin/bash
# Включаем логирование ошибок
set -e

echo "Starting AfterInstall hook..."

# Указываем полные пути к docker и aws (обычно /usr/bin/)
DOCKER="/usr/bin/docker"
AWS="/usr/bin/aws"
REGION="us-east-1"
IMAGE_URL="004226106633.dkr.ecr.us-east-1.amazonaws.com/my-nodejs-app:latest"

# 1. Авторизация в ECR
echo "Logging in to Amazon ECR..."
$AWS ecr get-login-password --region $REGION | $DOCKER login --username AWS --password-stdin 004226106633.dkr.ecr.us-east-1.amazonaws.com

# 2. Остановка и удаление старого контейнера
echo "Cleaning up old containers..."
$DOCKER stop my-nodejs-app || true
$DOCKER rm my-nodejs-app || true

# 3. Запуск нового контейнера
echo "Running new container..."
$DOCKER run -d --name my-nodejs-app -p 80:8080 $IMAGE_URL

echo "Deployment finished successfully!"
