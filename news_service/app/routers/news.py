from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List

from app.models import News
from app.schemas import NewsCreate, NewsUpdate, NewsResponse
from app.database import get_db

router = APIRouter(prefix="/news", tags=["News"])

@router.get("/", response_model=List[NewsResponse])
def get_all_news(db: Session = Depends(get_db)):
    return db.query(News).all()

@router.get("/{symbol}", response_model=List[NewsResponse])
def get_news_by_symbol(symbol: str, db: Session = Depends(get_db)):
    news = db.query(News).filter(News.symbol == symbol).all()
    if not news:
        raise HTTPException(status_code=404, detail="No news found for this company")
    return news

@router.post("/", response_model=NewsResponse)
def create_news(news: NewsCreate, db: Session = Depends(get_db)):
    db_news = News(**news.dict())
    db.add(db_news)
    db.commit()
    db.refresh(db_news)
    return db_news

@router.put("/{news_id}", response_model=NewsResponse)
def update_news(news_id: int, news_update: NewsUpdate, db: Session = Depends(get_db)):
    news = db.query(News).filter(News.id == news_id).first()
    if not news:
        raise HTTPException(status_code=404, detail="News not found")
    
    for key, value in news_update.dict(exclude_unset=True).items():
        setattr(news, key, value)

    db.commit()
    db.refresh(news)
    return news

@router.delete("/{news_id}", response_model=dict)
def delete_news(news_id: int, db: Session = Depends(get_db)):
    news = db.query(News).filter(News.id == news_id).first()
    if not news:
        raise HTTPException(status_code=404, detail="News not found")
    
    db.delete(news)
    db.commit()
    return {"message": "News deleted successfully"}
