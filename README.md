# E-commerce Analytics Platform (PostgreSQL + Power BI)

## Overview
This project simulates a real-world data engineering pipeline for an e-commerce company. It transforms raw transactional data into analytics-ready datasets and visual dashboards.

---

## Problem Statement
Business stakeholders needed structured insights from raw e-commerce data stored in PostgreSQL. A reporting layer was built to support dashboards in Power BI.

---

## Architecture
Kaggle Dataset → PostgreSQL → SQL Transformations → Views → Power BI

---

## Tech Stack
- PostgreSQL
- SQL (Joins, CTEs, Window Functions)
- Power BI
- GitHub

---

## Data Model
Customers → Orders → Order Items → Payments

---

## Key Features
- Monthly revenue tracking
- Customer revenue ranking
- Product performance analysis
- Time-based trends using DATE_TRUNC and LAG

---

## SQL Concepts Used
- JOINs
- GROUP BY
- CTEs
- Window Functions (RANK, LAG, SUM OVER)
- DATE_TRUNC

---

## Dashboards

### Executive Dashboard
Shows revenue trends and KPIs

### Customer Analysis
Shows top customers and regional performance

### Product Analysis
Shows product sales performance

---

## How to Run
1. Create PostgreSQL database
2. Run sql/01_create_tables.sql
3. Load data using sql/02_load_data.sql
4. Run sql/05_views.sql
5. Connect Power BI to views

---
