# 💖 San Valentín - Deploy en Railway

## 🚀 Instrucciones para desplegar en Railway

### Requisitos previos:
- Cuenta en [Railway.app](https://railway.app)
- Git configurado

### Opción 1: Deploy automático desde GitHub (Recomendado)

1. **Pushea el código a GitHub:**
   ```bash
   git add .
   git commit -m "Docker setup for Railway"
   git push
   ```

2. **En Railway:**
   - Ve a [railway.app](https://railway.app)
   - Haz clic en "New Project" → "Deploy from GitHub"
   - Selecciona tu repositorio
   - Railway detectará automáticamente el `Dockerfile`
   - Haz clic en "Deploy"

### Opción 2: Deploy desde la CLI local

1. **Instala Railway CLI:**
   ```bash
   npm install -g @railway/cli
   # o si usas Homebrew en macOS:
   # brew install railway
   ```

2. **Inicia sesión:**
   ```bash
   railway login
   ```

3. **Crea un nuevo proyecto:**
   ```bash
   railway init
   ```

4. **Despliega:**
   ```bash
   railway up
   ```

### Opción 3: Deploy con Docker local primero (Para probar)

1. **Construye la imagen:**
   ```bash
   docker build -t san-valentin .
   ```

2. **Ejecuta el contenedor:**
   ```bash
   docker run -p 8080:8080 san-valentin
   ```

3. **Accede a:** `http://localhost:8080`

4. **O usa docker-compose:**
   ```bash
   docker-compose up
   ```

## 📋 Configuración en Railway

Una vez desplegado, Railway te mostrará una URL pública (ej: `https://san-valentin-production.up.railway.app`).

### Configurar variables de entorno (si las necesitas):
En el panel de Railway → "Variables", agrega lo que necesites (en este proyecto no son necesarias por el momento).

## 🛠️ Estructura

- **Dockerfile**: Configuración multi-stage con nginx para servir la app
- **nginx.conf**: Configuración de servidor con:
  - Caché inteligente de assets
  - Compression gzip
  - Headers de seguridad
  - Soporte para SPA
- **docker-compose.yml**: Para desarrollo local

## 📦 Tamaño de la imagen

La imagen resultante es muy ligera (~50MB) porque usa `nginx:alpine` como base.

## ✨ Features incluidos

- ✅ Compresión GZIP
- ✅ Caché de assets estáticos (1 año)
- ✅ Service Worker soportado
- ✅ PWA-ready
- ✅ Headers de seguridad
- ✅ Auto-reinicio en caso de fallos

---

¿Preguntas? Revisa la [documentación de Railway](https://docs.railway.app)
