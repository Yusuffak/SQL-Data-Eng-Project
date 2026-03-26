 # Exploratory Data Analysis — Job market analytics with SQL
![Data Warehouse](https://www.astera.com/wp-content/uploads/2024/01/Data-Warehouse-Architecture.png)

flowchart LR
    A[☁️ Custom Apps /\nEnterprise Apps] --> DW
    B[📄 Logs, Files\n& Media] --> DW

    subgraph DW [🗄️ DATA WAREHOUSE]
        direction TB
        S[🔵 STAGING]
        R[🟢 REPORTING]
        M[🟠 METADATA]
        S --> R --> M
    end

    DW --> C[🗃️ SALES]
    DW --> D[🗃️ FINANCE]
    DW --> E[🗃️ MARKETING]

    style DW fill:#1a1a2e,stroke:#4a90d9,color:#fff
    style S fill:#4a90d9,color:#fff
    style R fill:#5cb85c,color:#fff
    style M fill:#f0a500,color:#fff
    style A fill:#2d2d2d,stroke:#888,color:#fff
    style B fill:#2d2d2d,stroke:#888,color:#fff
    style C fill:#2c3e50,stroke:#888,color:#fff
    style D fill:#2c3e50,stroke:#888,color:#fff
    style E fill:#2c3e50,stroke:#888,color:#fff

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
[questions] (C:\Users\HP\SQL_Data_Eng\Lesson 1.9\1.9_EDAsql)

## Problem & Context

## Tech Stock
