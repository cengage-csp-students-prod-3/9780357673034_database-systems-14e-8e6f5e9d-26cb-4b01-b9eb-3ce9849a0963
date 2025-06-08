SELECT
    L1.INV_NUM,
    L1.LINE_NUM AS "L.LINE_NUM",          -- Alias for the first line item's number (Sealer)
    P1.PROD_SKU AS "P.PROD_SKU",           -- Alias for the first product's SKU (Sealer)
    P1.PROD_DESCRIPT AS "P.PROD_DESCRIPT", -- Alias for the first product's description (Sealer)
    L2.LINE_NUM AS "L2.LINE_NUM",          -- Alias for the second line item's number (Top Coat)
    P2.PROD_SKU AS "P2.PROD_SKU",          -- Alias for the second product's SKU (Top Coat)
    P2.PROD_DESCRIPT AS "P2.PROD_DESCRIPT",-- Alias for the second product's description (Top Coat)
    P1.BRAND_ID AS BRAND_ID               -- Alias for the brand ID
FROM
    LGLINE AS L1
INNER JOIN
    LGPRODUCT AS P1 ON L1.PROD_SKU = P1.PROD_SKU
INNER JOIN
    LGLINE AS L2 ON L1.INV_NUM = L2.INV_NUM AND L1.LINE_NUM <> L2.LINE_NUM -- Changed from < to <>
INNER JOIN
    LGPRODUCT AS P2 ON L2.PROD_SKU = P2.PROD_SKU
WHERE
    P1.PROD_CATEGORY = 'Sealer'
    AND P2.PROD_CATEGORY = 'Top Coat'
    AND P1.BRAND_ID = P2.BRAND_ID
ORDER BY
    L1.INV_NUM ASC,
    L1.LINE_NUM ASC,
    L2.LINE_NUM DESC;