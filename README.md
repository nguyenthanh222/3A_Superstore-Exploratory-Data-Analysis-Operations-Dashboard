# 🛒 3A Superstore: Diagnosing Sales, Customer Behavior & Operations (01/2021 - 08/2023)
## Author: Nguyễn Thi Anh Thành (Sales Data Analyst)

Date: 01/2026

Tools Used: Python, Power BI, SQL

Python: Pandas (Chunking), Numpy, Datetime.

Power BI: DAX, Data Modeling, ETL, Interactive Visualization.

SQL: CTEs, Joins, Case, Data Cleaning scripts.

# 🚀 Executive Summary
This transaction data analysis project for 3A Retail Supermarket in Türkiye aims to find the relationship between revenue, customer behavior, and warehouse operational performance. Using data from over 50,000 live transactions, the analysis assists Management in:

  Identifying product categories and contributing signals to the business.

  Understanding peak timeframes and demographic characteristics of target customers.

  Diagnosing operational trigger points (order delays) and related revenue losses.

  Developing strategies for optimizing warehouse operations and customer retention.

# 📌 Background & Objectives
## Background:
3A Superstore is a multi-category retail system with a large volume of transactions. However, fragmented data management makes it difficult to track on-the-delivery (OTD) performance and customer segmentation, leading to the risk of losing customers to competitors.

## Four Requirements from the Manager:
Revenue Analysis: Detailed breakdown by category, brand, and branch.

Shopping Behavior: Identifying peak hours and seasonal trends.

Geographic Performance: Evaluating business performance across regions and cities.

Customer Profiles: Segmentation by gender, age, and repeat customer rate.

# 📂 Dataset Description
Source: Kaggle (3A_Superstore Dataset).

Size: +50,000 records with 5 linked tables (Orders, Order_Details, Customers, Branches, Categories).

Format: CSV / Parquet.
## Data Schema
<img width="1036" height="719" alt="image" src="https://github.com/user-attachments/assets/6d9b51fd-1039-4556-b201-3aa97225410d" />


# 📊 Data Processing & Metric Definitions 
## Data Processing by Python :
Chunking Strategy: Use a chunk-by-chunking technique (chunk size = 100,000) to process the large Order_Details file without overflowing RAM.

Data Cleaning: * Handle actual data encoding errors (e.g., unifying branch codes from IS to IS).

Remove price (UnitPrice) and quantity (Amount) outliers using the IQR method.

Handle Null values ​​for UserGender and Region columns.

## DAX Calculations for KPIs:
## 1. Sales & Revenue:

Total Revenue = SUM(Order_Details[TotalPrice])

Late Revenue Impact = CALCULATE([Total Revenue], Fact_Orders[OTD_Status] = "Late") (Revenue affected by late orders).

## 2. Operations (On-Time Delivery):

OTD % (On-Time Delivery) = DIVIDE([On-Time Orders], [Total Orders])

Avg Prep Days = AVERAGE(Fact_Orders[Prep_Days]) (Average preparation time).

## 3. Customer Behavior:

Retention Rate % = DIVIDE([Returning Customers], [Total Customers])

New Customers = CALCULATE(DISTINCTCOUNT(Orders[USERID]), Orders[Customer_Type] = "New")

# 📊 Key Insights & Visualizations
## I. Overview & Revenue Performance
Total revenue: Reached approximately $8 billion from 10 million orders (Large-scale simulation data).

Key cities: Istanbul was the dominant market in terms of revenue (> $1 billion), followed by Ankara and Izmir.

Product mix: Revenue was evenly distributed across FMCG categories (Salt, Spices, Household goods, etc.), indicating a General Store model with low product dependency risk.
<img width="1339" height="730" alt="image" src="https://github.com/user-attachments/assets/14f77685-bf74-409a-83f4-50f6687f4fc2" />
## II. Behavior Analysis: Peak Times & Retention
Customer Loyalty: Tỷ lệ khách hàng quay lại đạt 43.75%, đóng góp nguồn thu ổn định.

Gender Gap: Nữ giới đóng góp tỷ trọng doanh thu cao hơn (~$4bn so với $3.8bn của nam giới).

Peak Season: Khách hàng mới tăng trưởng mạnh nhất vào Quý 1, nhưng chững lại từ tháng 3 trở đi, cho thấy sự thiếu hụt trong các chiến dịch Marketing giữa năm.

<img width="1337" height="728" alt="image" src="https://github.com/user-attachments/assets/a712bb35-6efb-4977-93fc-1e1b8e6cb408" />

## III. Operation Analysis: Diagnosing OTD
OTD Performance: Tỷ lệ giao hàng đúng hạn trung bình chỉ đạt 70%.

Late Impact: 30% đơn hàng trễ tương ứng với $2.34 tỷ doanh thu bị đe dọa về uy tín và rủi ro hoàn hàng.

Nút thắt chuẩn bị: Thời gian chuẩn bị hàng tại kho trung bình mất 4.5 ngày – đây là yếu tố chính kéo thấp chỉ số OTD.
<img width="1339" height="730" alt="image" src="https://github.com/user-attachments/assets/604a763f-aeb4-4073-be67-a000e0638623" />
## IV. Suggested Improvements
Campaign implementation: Offer vouchers to customer groups with more than 20 delayed orders.  
Automate real-time order status notifications to alleviate customer anxiety.
<img width="1340" height="734" alt="image" src="https://github.com/user-attachments/assets/f736369a-c468-4f9d-a97d-ac64e88d74df" />

## 💡 Action Strategies (Recommendations)
<img width="773" height="472" alt="image" src="https://github.com/user-attachments/assets/9be2d4a6-44f7-4502-bff6-bad717e443f3" />


## 📂 Project Structure
CRM_3A_Superstore.ipynb: Python code for data processing (Cleaning & Chunking).

3A_Superstore_Analysis.sql: SQL statements for analysis.
