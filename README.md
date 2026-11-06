# Node.js App Deploy with GitHub Actions

A minimal Express API, containerized with Docker, used to practise CI/CD with GitHub Actions.

Every push to `main` installs dependencies, starts the server and checks its response, builds the Docker image, smoke-tests the running container and publishes it to GitHub Container Registry (GHCR). Pull requests run the same checks without publishing.

## Stack

- Node.js 22 and Express 5
- Docker and Docker Compose
- GitHub Actions and GitHub Container Registry

## Run locally

```bash
npm install
npm start
# open http://localhost:8080
```

The server reads the port from `PORT` (default `8080`) and responds on `/` with:

```json
{ "msg": "Hello from the server" }
```

## Run with Docker

```bash
docker compose up --build
# or
docker build -t node-app .
docker run -p 8080:8080 node-app
```

## Pipeline

The workflow lives in [`.github/workflows/ci-cd.yml`](.github/workflows/ci-cd.yml).

| Job | What it does |
| --- | --- |
| `test` | `npm ci`, starts the server, checks `GET /` with `curl` |
| `docker` | Builds the image, runs it and checks `GET /`, then pushes `latest` and the commit SHA tag to `ghcr.io/bikash9cmd/nodejs-application-deploy-github-actions` |

The push uses the built-in `GITHUB_TOKEN`, so no extra secrets are needed. Pull the published image with:

```bash
docker pull ghcr.io/bikash9cmd/nodejs-application-deploy-github-actions:latest
```

## Project structure

```
.
├── .github/workflows/ci-cd.yml   # CI/CD pipeline
├── Dockerfile                    # Production image (node:22-alpine, non-root)
├── docker-compose.yml            # Local container run
├── index.js                      # Express server
└── package.json
```
