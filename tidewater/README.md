# Tidewater Kitchen — Full-Stack Restaurant Website

A restaurant website with a menu and table reservations, running as **three Docker containers** with Docker Compose.

| Container | Tech | Role |
|-----------|------|------|
| `web` | Nginx | Serves the website and forwards `/api` calls to the API |
| `api` | Node.js + Express | REST API: menu and reservations |
| `db`  | PostgreSQL 16 | Stores menu items and reservations |

## Run it

Requires [Docker Desktop](https://www.docker.com/products/docker-desktop/) (or Docker Engine with the Compose plugin).

```bash
docker compose up --build
```

Open **http://localhost:8080**.

Stop with `Ctrl+C`, then `docker compose down` (add `-v` to also delete the database data).

Optional: copy `.env.example` to `.env` to change the database credentials.

## Useful commands

```bash
docker compose ps                  # show the three running containers
docker compose logs -f api         # follow API logs
docker compose exec db psql -U tidewater -c "SELECT * FROM reservations;"
```

## API

- `GET /api/menu` — all menu items
- `POST /api/reservations` — body: `name, phone, guests, date, time, notes`
- `GET /api/health` — health check

## Project structure

```
.
├── docker-compose.yml
├── .env.example
├── db/init.sql          # schema + sample menu
├── api/                 # Express API + Dockerfile
└── web/                 # index.html + nginx.conf + Dockerfile
```
