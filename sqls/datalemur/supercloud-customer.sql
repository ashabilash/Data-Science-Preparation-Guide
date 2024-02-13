/*
A Microsoft Azure Supercloud customer is a company which buys at least 1 product from each product category.

Write a query to report the company ID which is a Supercloud customer.

As of 5 Dec 2022, data in the customer_contracts and products tables were updated.

customer_contracts Table:
Column Name	Type
customer_id	integer
product_id	integer
amount	integer
customer_contracts Example Input:
customer_id	product_id	amount
1	1	1000
1	3	2000
1	5	1500
2	2	3000
2	6	2000
products Table:
Column Name	Type
product_id	integer
product_category	string
product_name	string
products Example Input:
product_id	product_category	product_name
1	Analytics	Azure Databricks
2	Analytics	Azure Stream Analytics
4	Containers	Azure Kubernetes Service
5	Containers	Azure Service Fabric
6	Compute	Virtual Machines
7	Compute	Azure Functions
Example Output:
customer_id
1
Explanation:
Customer 1 bought from Analytics, Containers, and Compute categories of Azure, and thus is a Supercloud customer. Customer 2 isn't a Supercloud customer, since they don't buy any container services from Azure.
*/

WITH customer_product_category AS (
  SELECT 
    customer_id,
    COUNT(DISTINCT product_category) AS unique_product_categories
  FROM customer_contracts
  RIGHT JOIN products
  ON customer_contracts.product_id = products.product_id
  GROUP BY customer_id
)

SELECT
  customer_id
FROM
customer_product_category
WHERE
  unique_product_categories = (
    SELECT COUNT(DISTINCT product_category)
    FROM products
  )
;