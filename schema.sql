-- Create database if not exists
CREATE DATABASE stock_data;
CREATE USER trader WITH PASSWORD 'jnjnuh';
GRANT ALL PRIVILEGES ON DATABASE stock_data to trader;
ALTER USER trader WITH SUPERUSER;

-- Connect to the database
\c stock_data;

-- Table: stocks (Server 1)
CREATE TABLE stocks (
    id SERIAL PRIMARY KEY,
    symbol VARCHAR(10) UNIQUE NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    change_percent VARCHAR(10),
    market_cap VARCHAR(50)
);

-- Table: companies (Server 2)
CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    symbol VARCHAR(10) UNIQUE NOT NULL,
    revenue DECIMAL(15,2) NOT NULL,
    profit DECIMAL(15,2) NOT NULL,
    assets DECIMAL(15,2) NOT NULL,
    liabilities DECIMAL(15,2) NOT NULL,
    pe_ratio DECIMAL(10,2)
);

-- Table: news (Server 3)
CREATE TABLE news (
    id SERIAL PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    headline TEXT NOT NULL,
    date DATE NOT NULL,
    source VARCHAR(100) NOT NULL,
    CONSTRAINT fk_news_stock FOREIGN KEY (symbol) REFERENCES stocks(symbol) ON DELETE CASCADE
);

-- Indexes for faster lookups
CREATE INDEX idx_stocks_symbol ON stocks(symbol);
CREATE INDEX idx_companies_symbol ON companies(symbol);
CREATE INDEX idx_news_symbol ON news(symbol);

