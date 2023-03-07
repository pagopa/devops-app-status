from fastapi import FastAPI, Response
from http import HTTPStatus


app = FastAPI()


@app.get("/")
async def home_root():
    return Response(status_code=HTTPStatus.OK)


@app.get("/status")
async def status():
    return Response(status_code=HTTPStatus.OK)


@app.get("/health")
async def health():
    return Response(status_code=HTTPStatus.OK)


@app.get("/healthz")
async def healthz():
    return Response(status_code=HTTPStatus.OK)
