FROM python:3.10-alpine@sha256:b8541313282fa2e680cd19592c52aaa97adb833c7b8fcd73e22ecf0799ae549e

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
