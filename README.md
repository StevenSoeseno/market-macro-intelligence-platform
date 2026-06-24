Market Macro Intelligence Platform
Overview

The Market Macro Intelligence Platform is an end-to-end Data Engineering and Analytics project that integrates stock market data and macroeconomic indicators into a unified analytics platform.
The project automates data ingestion, storage, transformation, orchestration, and visualization to analyze how macroeconomic conditions influence AI-related stocks.

The platform combines:

1. Financial market data from Yahoo Finance
2. Macroeconomic indicators from FRED (Federal Reserve Economic Data)
3. Cloud storage and warehousing using Google Cloud Platform
4. Automated orchestration with Apache Airflow
5. Business intelligence dashboards using Power BI
   
Project Architecture
Yahoo Finance API        FRED API
       │                   │
       └─────────┬─────────┘
                 ▼
           Python ETL
                 ▼
          Apache Airflow
                 ▼
      Google Cloud Storage
                 ▼
        BigQuery Warehouse
                 ▼
          Analytics Layer
                 ▼
           Power BI
           
Business Problem:
Stock performance is often analyzed independently from macroeconomic conditions. However, factors such as interest rates, inflation, unemployment, and treasury yields significantly impact market behavior.

This project aims to:
- Centralize financial and macroeconomic data
- Automate data collection and processing
- Build analytical datasets for investment analysis
- Visualize relationships between macroeconomic indicators and stock performance
- Provide insights into AI-related stocks under changing economic conditions

Tickers analyzed:
NVDA (NVIDIA)
AMD (Advanced Micro Devices)
AVGO (Broadcom)
META (Meta Platforms)
TSM (Taiwan Semiconductor Manufacturing)
BABA (Alibaba)


The analytics layer is visualized using Power BI.

1. Page 1 — Macroeconomic Dashboard

    Features:
    
    Federal Funds Rate KPI
    Unemployment Rate KPI
    CPI KPI
    Treasury Yield KPI
    Historical macroeconomic trends

    Purpose:
    
    Provide a high-level overview of current economic conditions.

2. Page 2 — AI Stock Performance Dashboard

    Features:
    
    Stock selector
    Current Price
    52-Week High
    52-Week Low
    All-Time High
    RSI (14)
    Historical price trend
    Monthly trading volume
    Daily return analysis
    
    Purpose:
    
    Analyze individual stock performance over time.

3. Page 3 — Macro vs AI Stocks Analysis

    Features:
    
    Stock trend visualization
    CPI trend
    Federal Funds trend
    Treasury Yield trend
    Correlation heatmap
    Business insights panel
    
    Purpose:
    
    Understand how macroeconomic conditions relate to stock performance.

Key Insights

Analysis revealed several notable relationships:

NVDA, AVGO, META, and TSM exhibit strong positive correlations with CPI.
BABA demonstrates negative correlation with both Treasury Yield and Federal Funds Rate.
Semiconductor stocks appear more sensitive to macroeconomic conditions than Alibaba.
Inflation trends show meaningful relationships with AI-related equity performance.
