from fastapi import FastAPI
from app.routes.color import color
from app.routes.status import status_route
from app.routes.cosmosdb import cosmosdb


def include_router(app):
    app.include_router(color, prefix='/color')
    app.include_router(status_route, prefix='/status')
    app.include_router(cosmosdb, prefix='/cosmosdb')


def configure_application(app):
    include_router(app)
    return app


app = FastAPI()


@app.get("/")
async def home_root():
    return {"home_root": "ok"}


configure_application(app)

