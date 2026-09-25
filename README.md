# E-Commerce Data Engineering & Analytics Pipeline

An end-to-end cloud data engineering portfolio project that ingests e-commerce data, transforms it with dbt, stores analytics-ready models in Google BigQuery, and orchestrates the workflow with Dagster and Airbyte.

> **Portfolio note:** This repository is an independent adaptation of the concepts demonstrated in the LinkedIn Learning course *End-to-End Data Engineering Project* by Thalia Barrera. The original course is acknowledged here for transparency; the portfolio structure, documentation, and extensions in this repository are intended to demonstrate my own data-engineering work and learning.

## Project Overview

The goal is to build a maintainable analytics pipeline for an e-commerce business. Raw customer and order data is ingested into BigQuery, cleaned through dbt staging models, and transformed into analytics-ready dimensional models.

### Architecture

```text
E-Commerce Source Data
        |
        v
     Airbyte
        |
        v
 Google BigQuery
   raw_data layer
        |
        v
       dbt
  staging models
        |
        v
  analytics marts
        |
        v
    Dagster
  orchestration
```

## Technology Stack

- **Python** – project and orchestration support
- **SQL** – transformations and analytics modeling
- **Google BigQuery** – cloud data warehouse
- **Airbyte** – data ingestion
- **dbt** – transformation, testing, and documentation
- **Dagster** – pipeline orchestration
- **Git/GitHub** – version control and portfolio documentation

## Data Warehouse Layers

| Layer | Purpose |
|---|---|
| `raw_data` | Source data loaded by Airbyte |
| `staging` | Standardized and cleaned source models |
| `marts` | Business-facing analytics tables |

## dbt Models

### Staging

- `stg_customers` – standardized customer attributes
- `stg_orders` – standardized order attributes
- `stg_order_items` – order-line level data when available
- `stg_products` – product-level source data when available

### Marts

- `dim_customers` – customer-level order activity and lifecycle metrics
- `fact_orders` – analytics-ready order-level fact table

The models are intentionally separated into staging and marts so that source cleanup and business logic remain easy to maintain.

## Data Quality

The project uses dbt tests for important warehouse relationships and identifiers, including:

- Primary-key uniqueness
- Required/non-null fields
- Customer-to-order referential integrity
- Valid order-status values
- Source freshness monitoring

## Example Analytics Questions

The resulting warehouse can support questions such as:

- How many orders are being placed over time?
- Which customers have placed the most orders?
- What percentage of customers are repeat customers?
- What are the first and most recent order dates for each customer?
- How are orders distributed by country and city?
- Which order statuses require operational attention?

## Project Structure

```text
.
├── .github/
├── dagster_orchestration/
│   ├── dagster_orchestration/
│   └── dagster_orchestration_tests/
├── dbt_transformation/
│   ├── models/
│   │   ├── staging/
│   │   └── marts/
│   ├── tests/
│   ├── macros/
│   └── dbt_project.yml
├── CONTRIBUTING.md
├── LICENSE
├── NOTICE
└── README.md
```

## Setup

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/ecommerce-data-engineering-pipeline.git
cd ecommerce-data-engineering-pipeline
```

### 2. Create a Python environment

```bash
python -m venv .venv
.venv\Scripts\activate
```

For macOS/Linux:

```bash
source .venv/bin/activate
```

### 3. Configure BigQuery

Set the following environment variables before running dbt:

```text
DBT_BIGQUERY_PROJECT=<your-gcp-project-id>
DBT_BIGQUERY_DATASET=<your-dbt-dataset>
DBT_BIGQUERY_LOCATION=<your-bigquery-region>
DBT_BIGQUERY_KEYFILE_PATH=<path-to-service-account-json>
```

Do **not** commit service-account credentials, passwords, or other secrets to GitHub.

### 4. Run dbt

```bash
cd dbt_transformation
dbt debug
dbt run
dbt test
```

## Future Extensions

Planned improvements include:

- Incremental dbt models
- Additional product and order-item marts
- Automated pipeline scheduling
- Data-quality alerting
- Power BI/Tableau analytics dashboard
- CI checks for dbt compilation and tests

## Author

**Saikrishna Gandrathi**

MS in Management Information Systems | Data Engineering | Analytics
