End-to-End E-commerce Data Engineering Pipeline

A real-world Data Engineering project that transforms raw e-commerce transactional data into an analytics-ready reporting layer using PostgreSQL and SQL best practices.

Project Overview

This project simulates a real-world Data Engineering workflow using the Olist Brazilian E-commerce Dataset.

The primary objective is to transform raw transactional data into an analytics-ready reporting layer by applying PostgreSQL and SQL best practices.

Rather than querying raw operational tables directly, reusable SQL Views were created to separate business logic from the source data. This design closely mirrors how reporting layers are implemented in modern data warehouse environments, providing clean, consistent, and reusable datasets for analytics and business intelligence.

Business Problem

An e-commerce company stores millions of transactional records inside PostgreSQL.

Business users require reliable, standardized datasets for reporting and analytics without directly querying operational tables.

The objective of this project is to build a centralized reporting layer that delivers clean, consistent, and reusable datasets for downstream reporting and dashboard development.

Project Architecture
Kaggle Olist Dataset (CSV)
            │
            ▼
PostgreSQL Raw Tables
            │
            ▼
Data Validation & Quality Checks
            │
            ▼
SQL Transformations
            │
            ▼
Reporting Views
            │
            ▼
Analytics-Ready Data

Dataset

Source

Olist Brazilian E-commerce Public Dataset (Kaggle)

Tables Used

Customers
Orders
Order Items
Products
Payments

Tech Stack
PostgreSQL	
SQL	
Git	
GitHub
Database Design

Database Design

The database was designed using relational modeling principles.

Relationships
Customers → Orders
Orders → Order Items
Products → Order Items
Orders → Payments

To ensure referential integrity, primary and foreign keys were defined across all related tables.

Data Engineering Workflow
1. Database Design
Created relational database tables
Selected appropriate data types
Defined primary keys
2. Data Ingestion
Imported CSV files into PostgreSQL
Verified row counts
Validated successful imports
3. Data Quality
Performed multiple validation checks, including:
Null value detection
Duplicate record detection
Missing foreign keys
Referential integrity validation
4. SQL Transformations
Business logic was implemented using:
JOINs
Aggregations
CASE Statements
Common Table Expressions (CTEs)
Window Functions
5. Reporting Layer
Reusable SQL Views were created to support analytics and reporting.
Reporting Views
vw_monthly_sales
vw_customer_revenue
vw_product_performance

These views centralize business logic and simplify downstream reporting.

Skills Demonstrated
Relational Database Design
PostgreSQL
SQL
Data Validation
Data Cleaning
Data Modeling
SQL Views
Window Functions
Reporting Layer Design
Git
GitHub Documentation

Future Improvements

This project can be extended by implementing a modern cloud-based Data Engineering architecture.

Potential enhancements include:

Automating data ingestion using Python
Building ETL pipelines
Deploying PostgreSQL on AWS RDS
Containerizing the project using Docker
Orchestrating workflows with Apache Airflow

Project Outcome

This project demonstrates how raw transactional data can be transformed into an organized reporting layer that supports business analytics and dashboard development.

By separating business logic from operational data, the solution improves:

Data consistency
Query performance
Reusability
Maintainability
Scalability

This architecture reflects common practices used by modern Data Engineering teams in production environments.

Acknowledgements

Dataset

Olist Brazilian E-commerce Public Dataset (Kaggle)

Thank You

Thank you for taking the time to review this project.

Feedback, suggestions, and constructive contributions are always appreciated.
