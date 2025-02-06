from sqlalchemy import Column, Integer, String, Date
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class News(Base):
    __tablename__ = "news"

    id = Column(Integer, primary_key=True, index=True)
    symbol = Column(String, nullable=False)
    headline = Column(String, nullable=False)
    date = Column(Date, nullable=False)
    source = Column(String, nullable=False)
