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


## Mac Instructions ## 
python3 -m venv venv
source venv/bin/activate

## Install Dependencies ##
To run install the following
pip install -r requirements.txt

**Run the API**
uvicorn main:app --host 0.0.0.0 --port 8080 --reload

## Visit the API ##
Open your browser and go to:
    Swagger Docs: http://localhost:8080/docs
    Redoc: http://localhost:8080/redoc

## To Run It ##
docker-compose up --build
