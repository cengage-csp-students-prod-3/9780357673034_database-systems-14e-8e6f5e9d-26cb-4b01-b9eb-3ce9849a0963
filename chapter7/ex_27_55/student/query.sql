SELECT
    B.BRAND_NAME,
    B.BRAND_TYPE,
    -- Calculate the average price of products for each brand.
    -- This averages the PROD_PRICE from the LGPRODUCT table,
    -- ensuring each distinct product's price is included once in the average,
    -- regardless of how many times it was sold.
    -- COALESCE handles brands with no associated products, displaying 0.00.
    ROUND(COALESCE(AVG_PRICE.AvgBrandPrice, 0.00),2) AS AVERAGE_PRICE,
    -- Calculate the total units sold for products of each brand.
    -- SUM(LL.LINE_QTY) aggregates all units sold across all invoices for products
    -- belonging to that brand.
    -- COALESCE handles brands with no sales, displaying 0.
    COALESCE(TOTAL_SALES.TotalUnitsSold, 0) AS UNITS_SOLD
FROM
    LGBRAND B
LEFT JOIN (
    -- Subquery to compute the average product price for each brand.
    -- It groups by BRAND_ID to get the average for all products belonging to that brand.
    SELECT
        P.BRAND_ID,
        AVG(P.PROD_PRICE) AS AvgBrandPrice
    FROM
        LGPRODUCT P
    GROUP BY
        P.BRAND_ID
) AS AVG_PRICE ON B.BRAND_ID = AVG_PRICE.BRAND_ID
RIGHT JOIN (
    -- Subquery to compute the total units sold for each brand.
    -- It joins LGLINE (for quantity sold) with LGPRODUCT (to link to brand)
    -- and then groups by BRAND_ID.
    SELECT
        P.BRAND_ID,
        SUM(LL.LINE_QTY) AS TotalUnitsSold
    FROM
        LGLINE LL
    JOIN
        LGPRODUCT P ON LL.PROD_SKU = P.PROD_SKU
    GROUP BY
        P.BRAND_ID
) AS TOTAL_SALES ON B.BRAND_ID = TOTAL_SALES.BRAND_ID
ORDER BY
    B.BRAND_NAME; -- Sort the final results by brand name