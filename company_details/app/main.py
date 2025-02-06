from fastapi import FastAPI
from app.routers import company
from app.database import engine
from app.models import Base

# Initialize DB tables
Base.metadata.create_all(bind=engine)

app = FastAPI(title="Company Financial Data API")

# Include Company Routes
app.include_router(company.router)

@app.get("/")
def root():
    return {"message": "Welcome to Company Financial Data API"}
