# 🐳 Docker Compose - API Monedas

Esta documentación explica cómo usar Docker Compose para ejecutar la API de Monedas con PostgreSQL.

## 📋 Prerrequisitos

- Docker y Docker Compose instalados
- Puerto 8080 (aplicación), 5432 (PostgreSQL) y 8081 (Adminer) disponibles

## 🚀 Ejecución Rápida

### 1. Clonar y acceder al proyecto
```bash
git clone <tu-repositorio>
cd apimonedas
```

### 2. Ejecutar con Docker Compose
```bash
# Construir y ejecutar todos los servicios
docker-compose up --build

# Ejecutar en segundo plano
docker-compose up -d --build
```

### 3. Verificar que está funcionando
- **API**: http://localhost:8080/api/health
- **Swagger**: http://localhost:8080/swagger-ui.html
- **Adminer**: http://localhost:8081

## 🏗️ Servicios Incluidos

| Servicio | Puerto | Descripción |
|----------|---------|-------------|
| **api-monedas** | 8080 | API REST de monedas |
| **postgres** | 5432 | Base de datos PostgreSQL |
| **adminer** | 8081 | Administrador web de BD |

## ⚙️ Configuración

### Variables de Entorno

El archivo `.env` permite personalizar la configuración:

```bash
# Copiar archivo de ejemplo
cp .env.example .env

# Editar configuración
nano .env
```

### Configuración por Defecto

```properties
# Base de datos
POSTGRES_DB=monedas
POSTGRES_USER=postgres
POSTGRES_PASSWORD=sa
POSTGRES_PORT=5432

# Aplicación
APP_PORT=8080
ADMINER_PORT=8081

# JWT
JWT_SECRET=mySecretKey123456789
JWT_EXPIRATION=86400000
```

## 🔧 Comandos Útiles

### Gestión de Contenedores
```bash
# Iniciar servicios
docker-compose up -d

# Detener servicios
docker-compose down

# Reiniciar servicios
docker-compose restart

# Ver logs
docker-compose logs -f

# Ver logs de un servicio específico
docker-compose logs -f api-monedas
```

### Gestión de Datos
```bash
# Eliminar contenedores y volúmenes
docker-compose down -v

# Reconstruir imágenes
docker-compose build --no-cache

# Ejecutar comando en contenedor
docker-compose exec api-monedas bash
docker-compose exec postgres psql -U postgres -d monedas
```

### Depuración
```bash
# Verificar estado de servicios
docker-compose ps

# Inspeccionar logs detallados
docker-compose logs --tail=100 api-monedas

# Entrar al contenedor de la aplicación
docker-compose exec api-monedas bash

# Conectar a PostgreSQL
docker-compose exec postgres psql -U postgres -d monedas
```

## 📊 Adminer (Gestor de Base de Datos)

Accede a **http://localhost:8081** con:
- **Sistema**: PostgreSQL
- **Servidor**: postgres
- **Usuario**: postgres
- **Contraseña**: sa
- **Base de datos**: monedas

## 🔍 Endpoints de la API

Una vez en funcionamiento, puedes acceder a:

### Documentación
- **Swagger UI**: http://localhost:8080/swagger-ui.html
- **OpenAPI JSON**: http://localhost:8080/api-docs

### Health Check
- **Estado**: http://localhost:8080/api/health
- **Información**: http://localhost:8080/api/health/info

### Endpoints Principales
- **Monedas**: http://localhost:8080/api/monedas/*
- **Países**: http://localhost:8080/api/paises/*
- **Usuarios**: http://localhost:8080/api/usuarios/*

## 🔒 Seguridad y Producción

### Para Producción
1. **Cambiar contraseñas por defecto**
```bash
POSTGRES_PASSWORD=tu_password_seguro
JWT_SECRET=tu_jwt_secret_muy_largo_y_seguro
```

2. **Usar secretos de Docker**
```yaml
secrets:
  postgres_password:
    file: ./secrets/postgres_password.txt
```

3. **Configurar HTTPS**
4. **Limitar acceso a puertos**
5. **Configurar backup de base de datos**

### Variables de Entorno Recomendadas
```properties
# Producción
SPRING_PROFILES_ACTIVE=production
LOGGING_LEVEL_ROOT=WARN
JPA_SHOW_SQL=false
JPA_DDL_AUTO=validate
```

## 🐛 Resolución de Problemas

### La aplicación no se conecta a PostgreSQL
```bash
# Verificar que PostgreSQL esté ejecutándose
docker-compose ps postgres

# Verificar logs de PostgreSQL
docker-compose logs postgres

# Verificar conectividad de red
docker-compose exec api-monedas ping postgres
```

### Puerto ocupado
```bash
# Cambiar puerto en .env
APP_PORT=8081
POSTGRES_PORT=5433
ADMINER_PORT=8082

# Reiniciar servicios
docker-compose down && docker-compose up -d
```

### Problemas de permisos
```bash
# En Linux/Mac, verificar permisos
sudo chown -R $USER:$USER .
```

### Limpiar todo y empezar de nuevo
```bash
# Eliminar contenedores, volúmenes e imágenes
docker-compose down -v --rmi all

# Reconstruir desde cero
docker-compose up --build
```

## 📝 Notas Adicionales

- Los datos de PostgreSQL se persisten en el volumen `postgres_data`
- Los scripts en `init-scripts/` se ejecutan al crear la BD
- La aplicación espera a que PostgreSQL esté listo (healthcheck)
- Los logs están configurados para desarrollo (DEBUG)

## 🔄 Actualizaciones

Para actualizar la aplicación:
```bash
# Detener servicios
docker-compose down

# Actualizar código fuente
git pull

# Reconstruir y ejecutar
docker-compose up --build -d
```
