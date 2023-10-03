# Usa una imagen base de Node.js
FROM node:14

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el package.json y el package-lock.json (si existe)
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia todos los archivos del proyecto a /app
COPY . .

# Construye la aplicación React
RUN npm run build

# Configura el servidor web para servir la aplicación
EXPOSE 80
CMD [ "npx", "serve", "-s", "build", "-l", "80" ]
