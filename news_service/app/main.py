from fastapi import FastAPI
from app.routers import news
from app.database import engine
from app.models import Base

# Initialize database tables
Base.metadata.create_all(bind=engine)

app = FastAPI(title="News Service API")

# Include News Routes
app.include_router(news.router)

@app.get("/")
def root():
    return {"message": "Welcome to News Service API"}
