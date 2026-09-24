Sales Funnel Analysis using SQL & BigQuery

Project Overview

This project analyzes an e-commerce sales funnel using **SQL in Google BigQuery**.

The objective is to understand how users move through different stages of the customer journey, identify where users drop off, and calculate conversion rates at each stage.

The analysis follows the funnel:

**Views → Cart → Checkout → Payment → Purchase**

The project demonstrates practical SQL skills including **CTEs, CASE statements, COUNT DISTINCT, aggregations, and conversion/drop-off calculations**.

---

 🎯 Business Objective

The main objective of this analysis is to answer:

* How many users reach each stage of the sales funnel?
* What percentage of users convert from one stage to the next?
* What is the drop-off rate at each stage?
* What percentage of visitors ultimately make a purchase?
* Which funnel stage has the highest user drop-off?
* Where should the business focus its conversion improvement efforts?

---

 🛠️ Tools & Technologies

* **SQL**
* **Google BigQuery**
* **GitHub**
* **Power BI** 

---

 📂 Project Structure


sales-funnel-analysis-bigquery/
│
├── README.md
│
├── data/
│   └── Sales_funnel_data.csv
│
├── sql/
│   ├── 01_Funnel_Metrics.sql
│   ├── 02_Conversion_rates.sql
│   ├── 03_Source_traffic_analysis.sql
│   └── 04_Time_conversion_analysis.sql
│   ├── 05_Revenue_funnel_analysis.sql
|   ├── 06_Drop_off_analysis.sql
|   
├── results/
│   └── Conersion_rate_results.csv
│   ├── Revenue_analysis.sql
|   ├── avg_time_funnel_stages.sql
|   ├── source_conversion_rates.sql
|    
└── screenshots/
    ├── Conversion_drop_off_rates.png
    ├── funnel_stages.png
    ├── Power BI dashboard.png
    

 📊 Funnel Stages

The analysis tracks users through five stages:

| Stage        | Description                       |
| ------------ | --------------------------------- |
| Views        | User visits the website           |
| cart         | User adds a product to their cart |
| checkout     | User proceeds to checkout         |
| payment      | User starting the payment         |
| Purchase     | User completes the purchase       |

---

## 🔍 Analysis Performed

### 1. Data Exploration

The dataset was initially explored to understand:

* Number of records
* Number of unique users
* Available funnel stages
* Missing values
* Duplicate records
* Event timestamps
* Data distribution

Example:

```sql
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT user_id) AS unique_users
FROM `project_id.dataset_id.funnel_events`;
```

---

### 2. Users at Each Funnel Stage

The number of unique users reaching each stage was calculated using `COUNT(DISTINCT user_id)`.

```sql
SELECT
    stage,
    COUNT(DISTINCT user_id) AS users
FROM `project_id.dataset_id.funnel_events`
GROUP BY stage;
```

---

### 3. Conversion Rate

The conversion rate measures the percentage of users who move from one funnel stage to the next.

### Formula

```text
Conversion Rate =
Current Stage Users / Previous Stage Users × 100
```

Example:

```text
Product View = 7,500
Add to Cart  = 5,500

Conversion Rate =
5,500 / 7,500 × 100
= 73.33%
```

---

### 4. Drop-off

Drop-off represents the number of users who did not proceed to the next funnel stage.

### Formula

```text
Drop-off =
Previous Stage Users - Current Stage Users
```

Example:

```text
Product View = 7,500
Add to Cart  = 5,500

Drop-off =
7,500 - 5,500
= 2,000 users
```

---

### 5. Drop-off Rate

The drop-off rate shows the percentage of users lost between two consecutive funnel stages.

### Formula

```text
Drop-off Rate =
(Previous Stage Users - Current Stage Users)
/
Previous Stage Users × 100
```

Example:

```text
(7,500 - 5,500) / 7,500 × 100
= 26.67%
```

---

## 🧮 Final Funnel Metrics

Example output:

| Stage        |  Users | Conversion % | Drop-off | Drop-off % |
| ------------ | -----: | -----------: | -------: | ---------: |
| Visit        | 10,000 |      100.00% |        - |          - |
| Product View |  7,500 |       75.00% |    2,500 |     25.00% |
| Add to Cart  |  5,500 |       73.33% |    2,000 |     26.67% |
| Checkout     |  4,000 |       72.73% |    1,500 |     27.27% |
| Purchase     |  3,000 |       75.00% |    1,000 |     25.00% |

> **Note:** The values above are example results. The actual results depend on the dataset used for the project.

---

## 💡 Key Insights

The analysis can be used to identify:

* The number of users entering and completing the funnel
* Conversion between each stage
* The stages with the highest user loss
* Overall visitor-to-purchase conversion
* Potential areas for improving the customer journey

For example, if the largest drop-off occurs between **Product View and Add to Cart**, the business could investigate product pricing, product information, user experience, or other factors affecting add-to-cart behavior.

---

## 📈 Power BI Dashboard

The SQL results can also be connected to Power BI to create an interactive dashboard.

The dashboard can include:

* Total Visitors
* Product Views
* Add-to-Cart Users
* Checkout Users
* Purchases
* Overall Conversion Rate
* Funnel Chart
* Stage-wise Drop-off
* Conversion by Marketing Channel
* Conversion by Device
* Date-based analysis

### Dashboard Preview

Add your screenshot here:

```markdown
![Sales Funnel Dashboard](screenshots/04_powerbi_dashboard.png)
```

---

## 📁 Dataset

The project uses an e-commerce funnel dataset containing user activity across different stages of the customer journey.

Key fields include:

```text
user_id
stage
event_timestamp
```

A representative sample dataset is included in the `data/` folder.

---

## 🧠 SQL Concepts Demonstrated

This project demonstrates the following SQL concepts:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `COUNT()`
* `COUNT(DISTINCT)`
* `CASE WHEN`
* `CTEs`
* `LAG()`
* Window Functions
* `SAFE_DIVIDE()`
* `ROUND()`
* Date and timestamp functions
* Conversion rate calculations
* Drop-off calculations

---

## 📸 Project Screenshots

### BigQuery Dataset

![BigQuery Tables](screenshots/01_bigquery_tables.png)

### Data Exploration

![Data Exploration](screenshots/02_data_exploration.png)

### Funnel SQL Results

![Funnel SQL Results](screenshots/03_funnel_sql_results.png)

### Power BI Dashboard

![Power BI Dashboard](screenshots/04_powerbi_dashboard.png)

---

## 🚀 Skills Demonstrated

This project demonstrates an end-to-end data analytics workflow:

```text
Raw Data
   ↓
Data Exploration
   ↓
SQL Analysis
   ↓
Funnel Metrics
   ↓
Conversion & Drop-off Analysis
   ↓
Business Insights
   ↓
Power BI Visualization
```

---

## 👩‍💻 Author

**Rupa Raveena**

Aspiring Data Analyst | SQL | Power BI | Excel | BigQuery

GitHub: [Add your GitHub profile link here]

LinkedIn: [Add your LinkedIn profile link here]

