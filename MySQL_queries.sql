/* QUERY 1 - This query examines the shipment deliveries done by the three different modes of shipments.
With columns composed of mode of shipment, total shipments, on time and delayed shipment count(s), rate of shipments done on time.
RECOMMENDATION BASED ON DATA: Reinforce methods to improve rate of shipments arriving on time, especially with 
deliveries done though sea given it has the most volume. Aiming to improve by 5% in on-time rates across all shipment modes within the next quarter. */
SELECT 
	mode_of_shipment,
	COUNT(*) AS total_shipments,
    COUNT(CASE WHEN reached_on_time = 1 THEN 1 ELSE NULL END) AS on_time_shipment_count,
    SUM(CASE WHEN reached_on_time = 0 THEN 1 END) AS delayed_shipment_count,
    AVG(reached_on_time) * 100 AS on_time_percentage
FROM train
GROUP BY
	mode_of_shipment
;

/* QUERY 2 - This query shows the number of customers per discount brackets and their customer rating.
RECOMMENDATION BASED ON DATA: The 31-50 discount range yields the highest customer rating reviews. Reaffirming the efficiency of this discount range.
Systemic improvements for customer service quality for discounts in the 21-40 range is advised as it ranks the lowest amongst discount ranges per volume. */
SELECT 
	customer_rating,
    COUNT(CASE WHEN discount_offered BETWEEN 1 AND 20 THEN 1 ELSE NULL END) AS '1-20 discount',
    COUNT(CASE WHEN discount_offered BETWEEN 21 AND 40 THEN 1 ELSE NULL END) AS '21-40 discount',
    COUNT(CASE WHEN discount_offered BETWEEN 31 AND 50 THEN 1 ELSE NULL END) AS '31-50 discount',
    COUNT(CASE WHEN discount_offered >= 51 THEN 1 ELSE NULL END) AS '>51 discount'
FROM train
GROUP BY
	customer_rating
ORDER BY
	customer_rating DESC
;    

/* QUERY 3 - In this query, the quality of delivery is group by repeat customers. The data showing the different rates for repeat customers
and the average rating of their deliveries.
RECOMMENDATION BASED ON DATA: Majority of customers order 2-4 products. Improvement in sales may lie in incentivizing orders beyond the
usual 2-4 range by improving on-time rates for 4th-6th orders. */
SELECT 
	prior_purchases,
    AVG(reached_on_time) * 100 AS on_time_rate,
    AVG(customer_rating) AS avg_customer_rating,
    COUNT(*) AS total_customers
FROM train
GROUP BY
	prior_purchases 
ORDER BY 
	prior_purchases DESC
;


/* QUERY 4 - This query uses the 'FLOOR' syntax to discover the efficiency of product delivery. 
Further taking into account average product cost and their respective number of orders. 
RECOMMENDATION BASED ON DATA: Orders within 4000-5000 grams are significantly below the 50% on-time rate of delivery.
Structural improvements for package care and delivery-speed are needed for these orders as they make up the majority of shipments delivered. */
SELECT 
	FLOOR(weight_in_gms / 1000) * 1000 AS weight_category,
    AVG(reached_on_time) * 100 AS on_time_rate,
    AVG(cost_of_the_product) AS avg_product_cost,
    COUNT(*) AS num_of_orders
FROM train
GROUP BY
	weight_category
ORDER BY 
	weight_category DESC
;
