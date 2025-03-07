from fastapi import FastAPI
from pydantic import BaseModel
from typing import Dict

app = FastAPI(title="{{APP_NAME}} API")


class HelloResponse(BaseModel):
    message: str


@app.get("/api/hello", response_model=HelloResponse)
async def hello() -> Dict[str, str]:
    return {"message": "Hello from {{APP_NAME}} API!"}
