# Використовуємо офіційний образ Node.js
FROM public.ecr.aws/docker/library/node:14

# Встановлюємо робочу директорію
WORKDIR /usr/src/app

# Копіюємо package.json і встановлюємо залежності
COPY app/package*.json ./
RUN npm install

# Копіюємо весь код застосунку
COPY app/ .

# Відкриваємо порт, на якому працюватиме застосунок
EXPOSE 8080

# Запускаємо застосунок
CMD ["node", "index.js"]
