# Project Title

A brief description of what this project does and who it's for
# Restaurant Data Analysis

## Overview
This repository contains the analysis of a restaurant's order data using PostgreSQL. The dataset includes order details and menu items.

## Data Schema
- **order_details**: Contains information about each order, including `order_id`, `order_date`, `order_time`, and `item_id`.
- **menu_items**: Contains information about each menu item, including `menu_item_id`, `item_name`, `category`, and `price`.

## Insights

### 1. Total Number of Orders
```sql
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM order_details;
```sql

** visit my portfolio website ** [Ridwan's Portfolio](https://www.ridwan-ibrahim.netlify.app)
