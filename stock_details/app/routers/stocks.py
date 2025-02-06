from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List

from app.models import Stock
from app.schemas import StockCreate, StockUpdate, StockResponse
from app.database import get_db

router = APIRouter(prefix="/stocks", tags=["Stocks"])

@router.get("/", response_model=List[StockResponse])
def get_stocks(db: Session = Depends(get_db)):
    return db.query(Stock).all()

@router.get("/{symbol}", response_model=StockResponse)
def get_stock(symbol: str, db: Session = Depends(get_db)):
    stock = db.query(Stock).filter(Stock.symbol == symbol).first()
    if not stock:
        raise HTTPException(status_code=404, detail="Stock not found")
    return stock

@router.post("/", response_model=StockResponse)
def create_stock(stock: StockCreate, db: Session = Depends(get_db)):
    db_stock = Stock(**stock.dict())
    db.add(db_stock)
    db.commit()
    db.refresh(db_stock)
    return db_stock

@router.put("/{symbol}", response_model=StockResponse)
def update_stock(symbol: str, stock_update: StockUpdate, db: Session = Depends(get_db)):
    stock = db.query(Stock).filter(Stock.symbol == symbol).first()
    if not stock:
        raise HTTPException(status_code=404, detail="Stock not found")
    
    for key, value in stock_update.dict(exclude_unset=True).items():
        setattr(stock, key, value)

    db.commit()
    db.refresh(stock)
    return stock

@router.delete("/{symbol}", response_model=dict)
def delete_stock(symbol: str, db: Session = Depends(get_db)):
    stock = db.query(Stock).filter(Stock.symbol == symbol).first()
    if not stock:
        raise HTTPException(status_code=404, detail="Stock not found")
    
    db.delete(stock)
    db.commit()
    return {"message": "Stock deleted successfully"}
