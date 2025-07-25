# Instructions for setup

**Required dependencies** 
[Docker](https://docs.docker.com/engine/install/)
[Docker Desktop](https://www.docker.com/products/docker-desktop/)
[python](https://www.python.org/downloads/)
[helm](https://helm.sh/docs/intro/install/)
[Minikube](https://minikube.sigs.k8s.io/docs/start/)
[Kubernetes](https://kind.sigs.k8s.io/)

**Install Dependencies** 
```Bash
python3 -m venv venv
```
```Bash
source venv/bin/activate
```

**Note the below is needed for local running**
Install pip for python then install the below
[pip for python](https://packaging.python.org/en/latest/tutorials/installing-packages/)
*Then you can run the below in order*
```Bash
pip install flask-sqlalchemy
```
```Bash
pip install uvicorn
```
```Bash
pip install fastapi
```

# ▶️ Run Locally
```Bash
uvicorn main:app --host 0.0.0.0 --port 8080 --reload
```

# 🐳 Docker
**Build & Run**
```Bash
docker build -t bookstore-api .
```
```Bash
docker run -p 8080:8080 bookstore-api
```

**If using Docker Compose**
In terminal run the following
```Bash
docker compose up --build
```

# 🚀 GitHub Actions CI/CD
Every push to **main** triggers:

    Build Docker image

    Push to GitHub Container Registry (GHCR)
Image URL:
```Bash
ghcr.io/gabrielpora/docker-pipeline-demo:latest
```
**Pull GHCR Image:**
```Bash
docker pull ghcr.io/gabrielpora/docker-pipeline-demo:latest
```
**Run the image**
```Bash
docker run -d -p 8080:8080 ghcr.io/gabrielpora/docker-pipeline-demo:latest
```

**🧪 Test image locally**
```Bash
docker run -it --rm -p 8080:8080 ghcr.io/gabrielpora/docker-pipeline-demo:latest
```

Workflow:  [.github/workflows/docker-image.yml](.github/workflows/docker-image.yml)


# ☸️ Helm (Kubernetes Deployment, Minikube or Kubernetes)
📁 Helm Chart Structure

Located in: helm/bookstore-api/

Includes:

    Deployment.yaml

    Service.yaml

    Ingress.yaml

    ConfigMap.yaml

    values.yaml

## Option 1: Minikube:
**▶️ Run using Minikube**
Start a Local Cluster 
```Bash
minikube start
```

**📁Install Helm Chart with namespace**
```Bash
helm upgrade --install bookstore-api ./helm/bookstore-api \
  --namespace bookstore --create-namespace \
  --set image.repository=ghcr.io/gabrielpora/docker-pipeline-demo \
  --set image.tag=latest
```

**Check Pods and Services**
```Bash
kubectl get pods -n bookstore
```
```Bash
kubectl get svc -n bookstore
```

**🌐 Access the API (via Port Forwarding or Ingress)**
**Option 1: Port Forwarding**
```Bash
kubectl port-forward svc/bookstore-api 8080:8080 -n bookstore
```
Now visit: http://localhost:8080/docs

**Option 2: Ingress (Optional Setup)**
If your cluster supports ingress (like Minikube with ingress addon):
```Bash
minikube addons enable ingress
```
Then, update your /etc/hosts file with the hostname (bookstore.local) and map it to your Minikube IP.

**🧪 Test working After completing Access the API step**
Follow instructions at end of the doc to populate books using the swagger page.
You can run the below once completed.
```Bash
curl http://bookstore.local:8080/books/
```
Should see a json result 
```Json
[{"id":1,"title":"Test","author":"Tester","description":"Test description string","price":99.0}]
```

> **Troubleshooting Ingress Errors**
>
> If you see an error like:
> `admission webhook "validate.nginx.ingress.kubernetes.io" denied the request: host "bookstore.local" and path "/" is already defined in ingress ...`
>
> 1. Uninstall the old release:
>    ```bash
>    helm uninstall bookstore-api
>    ```
> 2. Check for leftover Ingress resources:
>    ```bash
>    kubectl get ingress -A
>    ```
> 3. Delete any remaining Ingress with the same host/path:
>    ```bash
>    kubectl delete ingress <ingress-name> -n <namespace>
>    ```
>    **For Example**
>    ```Bash
>    kubectl delete ingress bookstore-api -n bookstore
>    ```


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



## Visit the API once everything running
Open your browser and go to:
    Swagger Docs: http://localhost:8080/docs
    Redoc: http://localhost:8080/redoc

**Note:** 
I have added a testExample.json file for you to load a test book when going to the Swagger docs. Paste it in the Create section

![alt text](createBook.gif)


📬 Contact
[Gabriel Groener](https://github.com/GabrielPora)
For feedback, reach out or open an issue.
