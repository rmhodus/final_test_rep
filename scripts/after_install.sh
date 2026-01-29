#!/bin/bash

# Зупиняємо старий застосунок
docker stop my-nodejs-app || true
docker rm my-nodejs-app || true

# Запускаємо новий застосунок
docker run -d --name my-nodejs-app -p 80:8080 123456789012.dkr.ecr.us-east-1.amazonaws.com/my-nodejs-app:latest
