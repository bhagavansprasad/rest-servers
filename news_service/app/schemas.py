from pydantic import BaseModel
from datetime import date
from typing import Optional

class NewsBase(BaseModel):
    symbol: str
    headline: str
    date: date
    source: str

class NewsCreate(NewsBase):
    pass

class NewsUpdate(BaseModel):
    headline: Optional[str] = None
    date: Optional[date] = None
    source: Optional[str] = None

class NewsResponse(NewsBase):
    id: int

    class Config:
        orm_mode = True
