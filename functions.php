<?php

function sqlselectfromproducts()
{
    return "SELECT * FROM products;";
}

function sqlcustomerorders()
{
    return "SELECT c.first_name, c.last_name, ct.order_count, ct.total_spent FROM customer_totals AS ct
INNER JOIN customers AS c ON ct.customer_id = c.id;";
}