-- 1. How much monthly revenue is at risk because of churn?
SELECT 
    ROUND(SUM(monthly_charges), 2) AS revenue_at_risk
FROM customer_churn
WHERE churn_flag = 1;

-- 2. What is the churn rate?
SELECT
    ROUND(100.0 * SUM(churn_flag) / COUNT(*), 2) AS churn_rate
FROM customer_churn;

-- 3.Which plan type has the highest churn?
SELECT
    plan_type,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(100.0 * SUM(churn_flag) / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY plan_type
ORDER BY churn_rate DESC;

-- 4. Which contract type has the highest churn?
SELECT
    contract_type,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(100.0 * SUM(churn_flag) / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY contract_type
ORDER BY churn_rate DESC;

-- 5. Is high monthly spending associated with churn?
SELECT
    churn_flag,
    COUNT(*) AS customers,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charges
FROM customer_churn
GROUP BY churn_flag;

-- 6. Which churn-risk segment needs the most attention?
SELECT
    churn_risk,
    COUNT(*) AS customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(100.0 * SUM(churn_flag) / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY churn_risk
ORDER BY churn_rate DESC;

-- 7.What is the total number of customers, average monthly charge, and total monthly revenue for each plan type?
SELECT
    plan_type,
    COUNT(customerid) AS total_customers,
    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charge,
    ROUND(SUM(monthly_charges), 2) AS total_monthly_revenue
FROM customer_churn
GROUP BY plan_type;

-- 8.Which plan types have a churn rate higher than the overall customer churn rate?
WITH plan_churn AS (
    SELECT
        plan_type,
        ROUND(100.0 * SUM(churn_flag) / COUNT(*), 2) AS churn_rate
    FROM customer_churn
    GROUP BY plan_type
),
overall_churn AS (
    SELECT
        100.0 * SUM(churn_flag) / COUNT(*) AS overall_churn_rate
    FROM customer_churn
)

SELECT
    p.plan_type,
    p.churn_rate,
    ROUND(o.overall_churn_rate, 2) AS overall_churn_rate
FROM plan_churn p
CROSS JOIN overall_churn o
WHERE p.churn_rate > o.overall_churn_rate;

-- 9.Rank customers within each plan type based on their monthly charges, with the highest-paying customer ranked first.
SELECT
    customerid,
    plan_type,
    monthly_charges,
    RANK() OVER(
        PARTITION BY plan_type
        ORDER BY monthly_charges DESC
    ) AS charge_rank
FROM customer_churn;
select * from customer_churn
-- 10.How can customers be categorized into spending segments based on their monthly charges?
SELECT
    customerid,
    monthly_charges,
    CASE
        WHEN monthly_charges < 500 THEN 'Low Spender'
        WHEN monthly_charges BETWEEN 500 AND 1000 THEN 'Medium Spender'
        ELSE 'High Spender'
    END AS spending_segment
FROM customer_churn;

