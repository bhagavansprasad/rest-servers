# from fastapi import FastAPI

# app = FastAPI()

# @app.get("/")
# def read_root():
#     return {"message": "Welcome to stock_details"}

# if __name__ == "__main__":
#     import uvicorn
#     uvicorn.run(app, host="0.0.0.0", port=8000)

from fastapi import FastAPI
from app.routers import stocks
from app.database import engine
from app.models import Base

# Initialize DB tables
Base.metadata.create_all(bind=engine)

app = FastAPI(title="Stock Details API")

# Include Stock Routes
app.include_router(stocks.router)

@app.get("/")
def root():
    return {"message": "Welcome to Stock Details API"}
