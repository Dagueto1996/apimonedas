#!/bin/bash

echo "Desplegando recursos de Kubernetes..."

# Aplicar secretos
kubectl apply -f bdmonedas-secretos.yaml

# Aplicar PersistentVolume y PersistentVolumeClaim
kubectl apply -f bdmonedas-pv.yaml

# Aplicar Deployment y Service de PostgreSQL
kubectl apply -f bdmonedas-servicio.yaml

# Esperar a que PostgreSQL esté listo
echo "Esperando a que PostgreSQL esté listo..."
kubectl wait --for=condition=ready pod -l app=postgres --timeout=300s

# Aplicar Deployment y Service de la API
kubectl apply -f bdmonedas-sls.yaml

echo "Despliegue completado!"
echo "Verificando recursos..."
kubectl get all 