from pydantic import BaseModel
from typing import Optional

class StockBase(BaseModel):
    symbol: str
    company_name: str
    price: float
    change_percent: Optional[str] = None
    market_cap: Optional[str] = None

class StockCreate(StockBase):
    pass

class StockUpdate(BaseModel):
    price: Optional[float] = None
    change_percent: Optional[str] = None
    market_cap: Optional[str] = None

class StockResponse(StockBase):
    id: int

    class Config:
        orm_mode = True
