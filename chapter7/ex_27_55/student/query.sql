SELECT
    B.BRAND_NAME,
    B.BRAND_TYPE,
    P.PROD_SKU,
    P.PROD_DESCRIPT,
    P.PROD_PRICE
FROM
    LGBRAND B
JOIN
    LGPRODUCT P ON B.BRAND_ID = P.BRAND_ID
WHERE
    B.BRAND_TYPE != 'PREMIUM' -- Select products that are NOT a premium brand
    AND P.PROD_PRICE > (
        -- Subquery to find the maximum price of a premium brand product
        SELECT
            MAX(P2.PROD_PRICE)
        FROM
            LGBRAND B2
        JOIN
            LGPRODUCT P2 ON B2.BRAND_ID = P2.BRAND_ID
        WHERE
            B2.BRAND_TYPE = 'PREMIUM'
    )
ORDER BY
    B.BRAND_NAME,
    P.PROD_PRICE DESC; -- Order by brand name and then price (descending) as is common for "most expensive" queries