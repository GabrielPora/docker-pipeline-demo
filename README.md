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


Adding my own instructions below existing README

## Instructions for setup

**Required dependencies** 
[Docker Desktop](https://www.docker.com/products/docker-desktop/) or [Docker](https://docs.docker.com/engine/install/)
[python](https://www.python.org/downloads/)

**Install Dependencies** 
python3 -m venv venv
source venv/bin/activate

## To Run
In terminal run the following
**docker-compose up --build**

## Visit the API once everything running
Open your browser and go to:
    Swagger Docs: http://localhost:8080/docs
    Redoc: http://localhost:8080/redoc

**Note:** 
I have added a testExample.json file for you to load a test book when going to the Swagger docs. Paste it in the Create section

![alt text](createBook.gif)

If you like to have the build only build and not run will need to comment out the CMD line (26) in the the Dockerfile.
Then to run the programme you will use
uvicorn main:app --host 0.0.0.0 --port 8080 --reload