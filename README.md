# Gestión Académica

## Requisitos

- Docker Desktop
- Docker Compose

## Ejecutar

```bash
docker compose up -d
```

## Importar la base de datos

```bash
docker exec -i W4S2 posgrest123 -u postgres -p gestion_academica_universidad < gestion_academica.sql
```

## Credenciales

- Base de datos: gestion_academica_universidad
- Usuario: postgres
- Contraseña: posgrest123
- contraseña root: postgres123
