FROM python:3.10-alpine@sha256:39cf823f79c1a14d7d9bd8c81f8a686d24d1d2d0b2c3f7ef71adb41102b41456

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
