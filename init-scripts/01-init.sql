-- Script de inicialización para la base de datos de API Monedas
-- Este script se ejecuta automáticamente cuando se crea el contenedor de PostgreSQL

-- Crear extensiones necesarias
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Configurar zona horaria
SET TIME ZONE 'America/Mexico_City';

-- Crear esquemas si es necesario
-- CREATE SCHEMA IF NOT EXISTS monedas;

-- Insertar datos iniciales de ejemplo (opcional)
-- Estas tablas se crearán automáticamente por JPA/Hibernate

-- Comentarios para referencia de estructura esperada:
-- 
-- TABLA: paises
-- - id (BIGINT, PRIMARY KEY, AUTO_INCREMENT)
-- - nombre (VARCHAR)
-- - capital (VARCHAR)
-- - codigo_iso (VARCHAR)
-- - created_at (TIMESTAMP)
-- - updated_at (TIMESTAMP)
--
-- TABLA: monedas  
-- - id (BIGINT, PRIMARY KEY, AUTO_INCREMENT)
-- - nombre (VARCHAR)
-- - simbolo (VARCHAR)
-- - codigo_iso (VARCHAR)
-- - pais_id (BIGINT, FOREIGN KEY)
-- - created_at (TIMESTAMP)
-- - updated_at (TIMESTAMP)
--
-- TABLA: usuarios
-- - id (BIGINT, PRIMARY KEY, AUTO_INCREMENT)
-- - nombre_usuario (VARCHAR)
-- - clave (VARCHAR) -- encriptada
-- - email (VARCHAR)
-- - activo (BOOLEAN)
-- - created_at (TIMESTAMP)
-- - updated_at (TIMESTAMP)
--
-- TABLA: cambio_moneda
-- - id (BIGINT, PRIMARY KEY, AUTO_INCREMENT)
-- - moneda_id (BIGINT, FOREIGN KEY)
-- - valor_anterior (DECIMAL)
-- - valor_nuevo (DECIMAL)
-- - fecha_cambio (TIMESTAMP)
-- - usuario_id (BIGINT, FOREIGN KEY)

-- Mensaje de confirmación
SELECT 'Base de datos inicializada correctamente para API Monedas' as mensaje;
