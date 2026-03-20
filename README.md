# Cross-Channel Marketing Performance Dashboard

## Live Dashboard
Tableau Public:  
https://public.tableau.com/app/profile/stephanie.yan1872/viz/Cross-ChannelMarketingPerformanceDashboard_17738522255970/Dashboard1#2

---

## Project Overview

This project analyzes multi-channel marketing campaign performance across different dimensions such as:

- Channel
- Campaign type
- Customer segment
- Location
- Language
- Audience demographics

The goal is to build an **interactive dashboard** that helps stakeholders:

- Identify high-performing marketing channels  
- Understand customer personas  
- Evaluate campaign effectiveness  
- Optimize marketing strategy  

---

## Data Source

- Dataset: Kaggle Marketing Campaign Performance dataset  
- Source: https://www.kaggle.com/code/alybalmes/marketing-campaign-performance-analysis  

---

## Data Engineering (BigQuery)

### Step 1 — Load Raw Data
- Uploaded dataset into Google BigQuery  
- Created raw table:
---

### Step 2 — Data Cleaning & Wrangling

SQL script: see `clean raw data.sql`

#### 🔹 Key Transformations

- **Standardized text fields**
  - Removed leading/trailing spaces using `TRIM()`
  - Applied to:
    - company
    - campaign_type
    - target_audience
    - channel_used
    - location
    - language
    - customer_segment

---

- **Converted Duration into numeric format**
  - Extracted numeric value from text like `"45 days"`

```sql
CAST(REGEXP_EXTRACT(Duration, r'(\d+)') AS INT64) AS duration_days
| Column           | Transformation   |
| ---------------- | ---------------- |
| Conversion_Rate  | STRING → FLOAT64 |
| Acquisition_Cost | STRING → FLOAT64 |
| ROI              | STRING → FLOAT64 |
| Clicks           | STRING → INT64   |
| Impressions      | STRING → INT64   |
| Engagement_Score | STRING → INT64   |

- **Output Table
Marketing_Campaign_Performance_Dataset.cleaned_campaign_data
