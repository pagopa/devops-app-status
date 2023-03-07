from fastapi import APIRouter
import logging
from dapr.clients import DaprClient
from python_random_strings import random_strings
import uuid


cosmosdb = APIRouter()


@cosmosdb.get("/")
async def home():
    return {"message": "home of cosmosdb"}


@cosmosdb.get("/dapr/sdk")
def dapr_sdk_cosmosdb():
    """
    create random value in cosmosdb with a sdk
    """
    key = random_strings.random_lowercase(4)
    value = str(uuid.uuid4())

    with DaprClient() as daprClient:
        daprClient.save_state(store_name="cosmosdb", key=key, value=value)

    logging.info("added cosmosdb key:f'{key}' and value f'{value}'")

    return {"cosmosdb key": f'{key}', "cosmosdb value": f'{value}'}

