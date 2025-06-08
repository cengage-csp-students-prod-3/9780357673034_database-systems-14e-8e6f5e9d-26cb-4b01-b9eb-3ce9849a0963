WITH SealerProducts AS (
    -- CTE 1: Get all line items for 'Sealer' products
    SELECT
        L.INV_NUM,
        L.LINE_NUM,
        P.PROD_SKU,
        P.PROD_DESCRIPT,
        P.BRAND_ID,
        P.PROD_CATEGORY
    FROM
        LGLINE AS L
    JOIN
        LGPRODUCT AS P ON L.PROD_SKU = P.PROD_SKU
    WHERE
        P.PROD_CATEGORY = 'Sealer'
),
TopCoatProducts AS (
    -- CTE 2: Get all line items for 'Top Coat' products
    SELECT
        L.INV_NUM,
        L.LINE_NUM,
        P.PROD_SKU,
        P.PROD_DESCRIPT,
        P.BRAND_ID,
        P.PROD_CATEGORY
    FROM
        LGLINE AS L
    JOIN
        LGPRODUCT AS P ON L.PROD_SKU = P.PROD_SKU
    WHERE
        P.PROD_CATEGORY = 'Top Coat'
)
SELECT
    SL.INV_NUM,
    SL.LINE_NUM AS SealerLineNum,
    SL.PROD_SKU AS SealerSKU,
    SL.PROD_DESCRIPT AS SealerDescription,
    TCL.LINE_NUM AS TopCoatLineNum,
    TCL.PROD_SKU AS TopCoatSKU,
    TCL.PROD_DESCRIPT AS TopCoatDescription,
    SL.BRAND_ID
FROM
    SealerProducts AS SL
JOIN
    TopCoatProducts AS TCL
ON
    SL.INV_NUM = TCL.INV_NUM          -- Both products must be on the same invoice
    AND SL.BRAND_ID = TCL.BRAND_ID    -- Both products must be from the same brand
    AND SL.LINE_NUM < TCL.LINE_NUM    -- Ensure distinct line items and avoid duplicate pairs (e.g., A-B vs B-A)
ORDER BY
    SL.INV_NUM ASC,
    SL.LINE_NUM ASC,
    TCL.LINE_NUM DESC;