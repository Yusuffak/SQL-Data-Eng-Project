 # Exploratory Data Analysis — Job market analytics with SQL


```mermaid
flowchart LR
    A[Custom Apps] --> DW
    B[Logs & Files] --> DW

    subgraph DW [DATA WAREHOUSE]
        direction TB
        S[STAGING]
        R[REPORTING]
        M[METADATA]
        S --> R --> M
    end

    DW --> C[SALES]
    DW --> D[FINANCE]
    DW --> E[MARKETING]
```

📊 Job Market Analytics — Data Engineering Roles
A SQL-based exploratory data analysis project built on real-world job posting data, designed around a star schema data warehouse. This project demonstrates my ability to write production-quality analytical SQL, design efficient queries, and translate business questions into actionable, data-driven insights.
🔍 What This Project Covers

Identifying the most in-demand skills for data engineering roles
Analyzing salary patterns across job titles and locations
Discovering optimal skill combinations that maximize earning potential
Structuring queries for clarity, performance, and reusability


A star schema data warehouse design used to extract insights on skill demand, salary patterns, and optimal skill combinations for data engineering roles.


Schema structure

Fact table — job_postings_fact

Central table containing job posting details — titles, locations, salaries, dates, and more.

Dimension tables

company_dim Company information linked to job postings
skills_dim Skills catalog with skill names and types
Bridge table — skills_job_dim

Resolves the many-to-many relationship between job postings and skills.

Starting off my first project on data engineering

## Exceutive Summary


## Executive Summary

- ✅ **Project Scope:** Developed three analytical queries to address critical questions within the data engineering job market  
- ✅ **Data Modeling:** Leveraged multi-table joins across fact and dimension tables to generate meaningful insights  
- ✅ **Analytics:** Applied aggregations, filtering, and sorting to identify top skills based on demand, salary, and overall value  
- ✅ **Outcomes:** Produced actionable insights highlighting the dominance of SQL/Python, emerging cloud trends, and salary patterns  

📂 [View SQL Queries](1.9_EDAsql)

## Problem & Context

Job market analysts need to answer questions like:

🎯 Most in-demand: Which skills are most in-demand for data engineers?
💰 Highest paid: Which skills command the highest salaries?
⚖️ Best trade-off: What is the optimal skill set balancing demand and compensation?
This project analyzes a data warehouse built using a star schema design. The warehouse structure consists of:

Data Warehouse Schema

## 🗄️ Data Warehouse Schema
```mermaid
erDiagram
    job_postings_fact {
        int job_id PK
        int company_id FK
        string job_title_short
        string job_title
        string job_location
        string job_via
        string job_schedule_type
        boolean job_work_from_home
        string search_location
        date job_posted_date
        boolean job_no_degree_mention
        boolean job_health_insurance
        string job_country
        string salary_rate
        float salary_year_avg
        float salary_hour_avg
    }

    company_dim {
        int company_id PK
        string name
        string link
        string link_google
        string thumbnail
    }

    skills_dim {
        int skill_id PK
        string skills
        string type
    }

    skills_job_dim {
        int job_id PK_FK
        int skill_id PK_FK
    }

    job_postings_fact ||--o{ skills_job_dim : "has"
    skills_dim ||--o{ skills_job_dim : "tagged in"
    company_dim ||--o{ job_postings_fact : "posts"
```

Fact Table: job_postings_fact - Central table containing job posting details (job titles, locations, salaries, dates, etc.)
Dimension Tables:
company_dim - Company information linked to job postings
skills_dim - Skills catalog with skill names and types
Bridge Table: skills_job_dim - Resolves the many-to-many relationship between job postings and skills
By querying across these interconnected tables, I extracted insights about skill demand, salary patterns, and optimal skill combinations for data engineering roles.



## Tech Stock
