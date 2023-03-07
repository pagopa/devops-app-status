from fastapi import APIRouter, Response
from http import HTTPStatus

status_route = APIRouter()


@status_route.get("/")
async def status():
    return Response(status_code=HTTPStatus.OK)
