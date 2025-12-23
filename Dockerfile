FROM node:22

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

# EXPOSE is optional and only documentation
EXPOSE 80

CMD ["npm", "run", "dev"]
