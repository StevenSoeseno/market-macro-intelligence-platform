# Market & Macro Intelligence Platform

> An end-to-end data engineering and analytics project that integrates stock market data with macroeconomic indicators to analyze how macro conditions influence AI-related equities.

---

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Business Problem](#business-problem)
- [Tickers Analyzed](#tickers-analyzed)
- [Dashboards](#dashboards)
- [Key Insights](#key-insights)

---

## Overview

The Market & Macro Intelligence Platform automates data ingestion, storage, transformation, orchestration, and visualization across a unified analytics stack.

**Data sources:**
- **Yahoo Finance** — financial market data
- **FRED (Federal Reserve Economic Data)** — macroeconomic indicators

**Infrastructure:**
- Cloud storage and warehousing on Google Cloud Platform
- Pipeline orchestration with Apache Airflow
- Business intelligence dashboards in Power BI

---

## Architecture

```
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
```

---

## Business Problem

Stock performance is typically analyzed in isolation from macroeconomic conditions. However, factors such as interest rates, inflation, unemployment, and treasury yields significantly influence market behavior.

This platform aims to:

- Centralize financial and macroeconomic data in a single warehouse
- Automate data collection and processing pipelines
- Build analytical datasets suited for investment analysis
- Visualize relationships between macroeconomic indicators and stock performance
- Provide insights into AI-related equities under changing economic conditions

---

## Tickers Analyzed

| Ticker | Company |
|--------|---------|
| NVDA | NVIDIA |
| AMD | Advanced Micro Devices |
| AVGO | Broadcom |
| META | Meta Platforms |
| TSM | Taiwan Semiconductor Manufacturing |
| BABA | Alibaba |

---

## Dashboards

The analytics layer is visualized across three Power BI pages.

### Page 1 — Macroeconomic Dashboard

Provides a high-level overview of current economic conditions.

**KPI cards:** Federal Funds Rate · Unemployment Rate · CPI · Treasury Yield

**Visuals:** Historical macroeconomic trends

---

### Page 2 — AI Stock Performance Dashboard

Analyzes individual stock performance over time.

**KPI cards:** Current Price · 52-Week High · 52-Week Low · All-Time High · RSI (14)

**Visuals:** Historical price trend · Monthly trading volume · Daily return analysis

**Controls:** Stock selector

---

### Page 3 — Macro vs. AI Stocks Analysis

Surfaces relationships between macroeconomic conditions and stock performance.

**Visuals:** Stock trend · CPI trend · Federal Funds trend · Treasury Yield trend · Correlation heatmap · Business insights panel

---

## Key Insights

Analysis revealed several notable relationships between macroeconomic indicators and AI-related equities:

- **NVDA, AVGO, META, and TSM** exhibit strong positive correlations with CPI
- **BABA** demonstrates negative correlation with both Treasury Yield and the Federal Funds Rate
- **Semiconductor stocks** appear more sensitive to macroeconomic conditions than Alibaba
- **Inflation trends** show meaningful relationships with AI-related equity performance
