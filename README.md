# my_e-commerce_project
Analyzed 10k shipping records from a denormalized dataset using SQL (MySQL) to uncover logistics bottlenecks. Engineered queries to reveal various rates of shipment modes and a correlation between high discounts and delivery lags. Aggregated KPIs for delivery performance and customer ratings to provide data-driven insights for supply chain optimization.

Raw data can be found in raw_data.csv

Queries and in-depth insights for data interpretation are found in MySQL_queries.sql

-----

📊 Project Highlights & Insight Summary
1. Logistics Efficiency by Shipment Mode
Insight: Evaluated volume vs. delay counts across Flight, Ship, and Road.

Business Impact: Targeted a 5% improvement in on-time arrivals for the next quarter by identifying bottlenecks in current shipment methods.

-----

2. Discount Strategy vs. Customer Satisfaction
Insight: Used range-based grouping to find that the 31-50 discount bracket yields the highest customer ratings.

Business Impact: Recommended a service quality focus for the 21-40 discount range to bridge the satisfaction gap.

-----

3. Repeat Customer Retention
Insight: Analyzed delivery quality for customers with repeat purchases.

Business Impact: Found that 4th–6th orders suffer from higher delays; suggested loyalty incentives and prioritized shipping for high-frequency shoppers.

-----

4. Heavy-Weight Shipment Bottlenecks
Insight: Used FLOOR functions to bucket product weights; discovered that 4,000–5,000g shipments consistently fall below a 50% on-time rate.

Business Impact: Identified a critical need for structural logistics changes for heavy-tier products, which represent the majority of the firm's volume.

-----

🤖 Technical Skills Demonstrated
Aggregations: COUNT, SUM, AVG.

Mathematical Functions: FLOOR for data binning.

Conditional Logic: CASE WHEN for delivery status and discount brackets.

Data Analysis: Trend identification and prescriptive recommendations.
