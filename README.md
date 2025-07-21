# Instructions for setup

**Required dependencies** 
[Docker](https://docs.docker.com/engine/install/)
[Docker Desktop](https://www.docker.com/products/docker-desktop/)
[python](https://www.python.org/downloads/)
[helm](https://helm.sh/docs/intro/install/)

**Install Dependencies** 
**python3 -m venv venv**
**source venv/bin/activate**

# ▶️ Run Locally
uvicorn app.main:app --host 0.0.0.0 --port 8080 --reload

# 🐳 Docker
## Build & Run
**docker build -t bookstore-api .**
**docker run -p 8080:8080 bookstore-api**

## If using Docker Compose
In terminal run the following
**docker compose up --build**

# 🚀 GitHub Actions CI/CD
Every push to main triggers:

    Build Docker image

    Push to GitHub Container Registry (GHCR)
Image URL:
**ghcr.io/gabrielpora/docker-pipeline-demo:latest**

Workflow:  [.github/workflows/docker-image.yml](.github/workflows/docker-image.yml)


# ☸️ Helm (Kubernetes Deployment)
📁 Helm Chart Structure

Located in: helm/bookstore-api/

Includes:

    Deployment.yaml

    Service.yaml

    Ingress.yaml

    ConfigMap.yaml

    values.yaml

## Install on any cluster
**helm install bookstore-api ./helm/bookstore-api \
  --set image.repository=ghcr.io/gabrielpora/docker-pipeline-demo \
  --set image.tag=latest**

## Override environment
**helm install bookstore-api ./helm/bookstore-api \
  --values env/dev.yaml**


## Package the chart
helm package helm/bookstore-api

## Deploy to a cluster
helm upgrade --install bookstore-api ./bookstore-api-1.0.0.tgz \
  --namespace bookstore --create-namespace

# ⚙️ Configuration 
**Bookstore API Config**


| Variable          | Default                                  | Description                                                      |
|-------------------|------------------------------------------|------------------------------------------------------------------|
| `DATABASE_URL`    | `sqlite:///./books.db`                   | SQLAlchemy database connection string.                           |
| `LOG_LEVEL`       | `INFO`                                   | Root logger level (e.g. DEBUG, INFO, WARNING).                  |
| `LOG_FORMAT`      | `%(levelname)s:%(name)s:%(message)s`     | Python `logging` format string.                                  |
| `PAGE_SIZE`       | `10`                                     | Number of items per page on the `/books/` endpoint.             |
| `APP_ENV`         | `dev`                                    | App environment label (e.g. dev / staging / prod).              |
| `HOST`            | `0.0.0.0`                                | Uvicorn host binding.                                           |
| `PORT`            | `8080`                                   | Uvicorn port.                                                   |
| `RELOAD`          | `False`                                  | Whether Uvicorn runs in reload mode (`True`/`False`).           |
| `ALLOWED_ORIGINS` | `*`                                      | Comma-separated list for CORS allowed origins (`*` = all).      |
| `DB_POOL_SIZE`    | `5`                                      | SQLAlchemy connection-pool size.                                |
| `DB_MAX_OVERFLOW` | `10`                                     | SQLAlchemy max overflow connections beyond the pool size.       |



# Visit the API once everything running
Open your browser and go to:
    Swagger Docs: http://localhost:8080/docs
    Redoc: http://localhost:8080/redoc

**Note:** 
I have added a testExample.json file for you to load a test book when going to the Swagger docs. Paste it in the Create section

![alt text](createBook.gif)


📬 Contact
[Gabriel Groener](https://github.com/GabrielPora)
For feedback, reach out or open an issue.