from pydantic import BaseModel
from typing import Optional

class CompanyBase(BaseModel):
    symbol: str
    company_name: str  # Added this line
    revenue: float
    profit: float
    assets: float
    liabilities: float
    pe_ratio: Optional[float] = None

class CompanyCreate(CompanyBase):
    pass

class CompanyUpdate(BaseModel):
    revenue: Optional[float] = None
    profit: Optional[float] = None
    assets: Optional[float] = None
    liabilities: Optional[float] = None
    pe_ratio: Optional[float] = None

class CompanyResponse(CompanyBase):
    id: int

    class Config:
        orm_mode = True
