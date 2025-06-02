## Problem 33

Create a stored procedure named `prc_inv_amounts` to update the `INV_SUBTOTAL`, `INV_TAX`, and `INV_TOTAL`. The procedure takes the invoice number as a parameter. The `INV_SUBTOTAL` is the sum of the `LINE_TOTAL` amounts for the invoice, the `INV_TAX` is the product of the `INV_SUBTOTAL` and the tax rate (8 percent), and the `INV_TOTAL` is the sum of the `INV_SUBTOTAL` and the `INV_TAX`.
