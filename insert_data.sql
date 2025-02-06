-- Use the stock_data database
\c stock_data;

INSERT INTO stocks (symbol, company_name, price, change_percent, market_cap)
VALUES
    ('AAPL', 'Apple Inc.', 175.25, '1.5%', '2.8T'),
    ('TSLA', 'Tesla Inc.', 720.30, '-2.0%', '800B'),
    ('MSFT', 'Microsoft Corp.', 330.50, '0.8%', '2.5T'),
    ('GOOGL', 'Alphabet Inc.', 140.75, '0.6%', '1.8T'),
    ('AMZN', 'Amazon Inc.', 155.80, '1.2%', '1.7T'),
    ('NFLX', 'Netflix Inc.', 450.90, '-1.0%', '210B'),
    ('META', 'Meta Platforms Inc.', 320.25, '0.9%', '1.2T'),
    ('NVDA', 'NVIDIA Corporation', 825.40, '2.3%', '1.6T'),
    ('AMD', 'Advanced Micro Devices', 125.50, '-0.5%', '190B'),
    ('INTC', 'Intel Corporation', 55.75, '0.4%', '220B');


INSERT INTO companies (symbol, company_name, revenue, profit, assets, liabilities, pe_ratio)
VALUES
    ('AAPL', 'Apple Inc.', 365000000000, 94000000000, 500000000000, 200000000000, 28.4),
    ('TSLA', 'Tesla Inc.', 80000000000, 8000000000, 120000000000, 45000000000, 75.6),
    ('MSFT', 'Microsoft Corp.', 250000000000, 85000000000, 600000000000, 220000000000, 30.1),
    ('GOOGL', 'Alphabet Inc.', 280000000000, 60000000000, 400000000000, 150000000000, 25.3),
    ('AMZN', 'Amazon Inc.', 510000000000, 12000000000, 350000000000, 180000000000, 35.2),
    ('NFLX', 'Netflix Inc.', 38000000000, 6000000000, 55000000000, 25000000000, 45.7),
    ('META', 'Meta Platforms Inc.', 120000000000, 30000000000, 140000000000, 60000000000, 22.8),
    ('NVDA', 'NVIDIA Corporation', 32000000000, 16000000000, 80000000000, 30000000000, 50.9),
    ('AMD', 'Advanced Micro Devices', 18000000000, 2500000000, 40000000000, 15000000000, 38.6),
    ('INTC', 'Intel Corporation', 75000000000, 15000000000, 250000000000, 100000000000, 12.5);

INSERT INTO news (symbol, headline, date, source)
VALUES
    ('AAPL', 'Apple announces record-breaking iPhone sales.', '2024-02-06', 'CNN'),
    ('TSLA', 'Tesla Cybertruck deliveries start next month.', '2024-02-05', 'Bloomberg'),
    ('MSFT', 'Microsoft unveils new AI-powered Copilot.', '2024-02-04', 'Reuters'),
    ('GOOGL', 'Alphabet expands its cloud services to new markets.', '2024-02-03', 'TechCrunch'),
    ('AMZN', 'Amazon Prime surpasses 300 million subscribers.', '2024-02-02', 'WSJ'),
    ('NFLX', 'Netflix releases record-breaking blockbuster series.', '2024-02-01', 'Forbes'),
    ('META', 'Meta to launch new VR headset this year.', '2024-01-31', 'CNBC'),
    ('NVDA', 'NVIDIA sees strong demand for AI-powered GPUs.', '2024-01-30', 'The Verge'),
    ('AMD', 'AMD unveils next-gen Ryzen processors for gaming.', '2024-01-29', 'Wired'),
    ('INTC', 'Intel partners with major tech firms on semiconductor research.', '2024-01-28', 'Financial Times');
