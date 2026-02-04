# Stage 1: Build
FROM node:18-alpine AS builder
WORKDIR /app
COPY . .
# No hay build necesario para esta app estática
# Solo copiamos los archivos

# Stage 2: Runtime
FROM nginx:alpine
WORKDIR /usr/share/nginx/html

# Copiar los archivos de la app desde el builder
COPY --from=builder /app .

# Copiar configuración de nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exponer puerto
EXPOSE 8080

# Comando para iniciar nginx
CMD ["nginx", "-g", "daemon off;"]
