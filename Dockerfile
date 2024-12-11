FROM python:3.10-alpine@sha256:748b5868188a58e05375eb70972cbdb338bae30c6e613a847910315e3d20afc4

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
