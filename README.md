# Node.js app deploy with Docker and GitHub Actions

A minimal Express API packaged as a Docker image, built as a practice project for containerizing a Node.js service and deploying it through a GitHub Actions CI/CD pipeline.

## Features

- Express 5 server with a single JSON endpoint
- Port configurable through the `PORT` environment variable (default `8080`)
- `Dockerfile` based on `node:22-alpine`
- `docker-compose.yml` for one-command local runs

## Tech stack

Node.js 22 · Express 5 · Docker · Docker Compose · GitHub Actions

## Getting started

### Run locally with Node

```bash
git clone https://github.com/bikash9cmd/nodejs-application-deploy-github-actions.git
cd nodejs-application-deploy-github-actions
npm install
npm start
```

### Run with Docker Compose

```bash
docker compose up --build
```

### Try it

```bash
curl http://localhost:8080/
# {"msg":"Hello from the server"}
```

## API

| Method | Path | Response |
|---|---|---|
| GET | `/` | `{"msg": "Hello from the server"}` |

## Project structure

```text
index.js             Express server
Dockerfile           Production image (node:22-alpine)
docker-compose.yml   Local run, maps port 8080
package.json         Scripts and dependencies
```

## Roadmap

- Add the GitHub Actions workflow (`.github/workflows/`) that builds the image, pushes it to a registry and deploys it.

## License

Released under the [MIT License](LICENSE).
