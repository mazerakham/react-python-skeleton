from fastapi.testclient import TestClient
from {{PYTHON_PACKAGE_NAME}}.app import app

client = TestClient(app)


def test_hello_endpoint() -> None:
    response = client.get("/api/hello")
    assert response.status_code == 200
    data = response.json()
    assert "message" in data
    assert data["message"] == "Hello from {{APP_NAME}} API!"
