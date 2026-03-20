CREATE TABLE Marketing_Campaign_Performance_Dataset.cleaned_campaign_data AS
SELECT
  Campaign_ID,
  TRIM(Company) AS company,
  TRIM(Campaign_Type) AS campaign_type,
  TRIM(Target_Audience) AS target_audience,
  CAST(REGEXP_EXTRACT(Duration, r'(\d+)') AS INT64) AS duration_days,
  TRIM(Channel_Used) AS channel_used,
  CAST(Conversion_Rate AS FLOAT64) AS conversion_rate,
  CAST(Acquisition_Cost AS FLOAT64) AS acquisition_cost,
  CAST(ROI AS FLOAT64) AS roi,
  TRIM(Location) AS location,
  TRIM(Language) AS language,
  CAST(Clicks AS INT64) AS clicks,
  CAST(Impressions AS INT64) AS impressions,
  CAST(Engagement_Score AS INT64) AS engagement_score,
  TRIM(Customer_Segment) AS customer_segment,
  Date AS campaign_date

FROM Marketing_Campaign_Performance_Dataset.raw_campaign_data;