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
docker exec -i [nombre_de_tu_contenedor] mysql -u root -p[tu_contraseña] gestion_academica_universidad < respaldo.sql
```

## Credenciales

- Base de datos: gestion_academica_universidad
- Usuario root: root
- Usuario: postgres
- Contraseña: posgrest123
- contraseña root: root123
