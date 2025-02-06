from sqlalchemy import Column, Integer, String, DECIMAL
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Company(Base):
    __tablename__ = "companies"

    id = Column(Integer, primary_key=True, index=True)
    symbol = Column(String, unique=True, nullable=False)
    company_name = Column(String, nullable=False)  # Added this line
    revenue = Column(DECIMAL(15,2), nullable=False)
    profit = Column(DECIMAL(15,2), nullable=False)
    assets = Column(DECIMAL(15,2), nullable=False)
    liabilities = Column(DECIMAL(15,2), nullable=False)
    pe_ratio = Column(DECIMAL(10,2), nullable=True)
