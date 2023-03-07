from fastapi import APIRouter
import requests
import logging
from dapr.clients import DaprClient

color = APIRouter()


@color.get("/")
async def home():
    return {"message": "home of color"}


@color.get("/dapr/http")
async def dapr_http_color():
    """
    return random color with a raw http request to dapr
    """
    r = requests.get('http://localhost:3500/v1.0/invoke/backend/method/color')
    color = r.text
    logging.info(r)
    return {"random color": f'{color}'}


@color.get("/dapr/sdk")
def dapr_sdk_color():
    """
    return random color with a sdk request to dapr
    """
    with DaprClient() as daprClient:
        result = daprClient.invoke_method(
            'backend',
            'color',
            content_type="utf-8",
            data=b'',
            http_verb="GET")

    color = result.data.decode("utf-8")

    logging.info(str(color))
    return {"random color": f'{str(color)}'}



