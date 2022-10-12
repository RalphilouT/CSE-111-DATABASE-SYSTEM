SELECT substr(l_receiptdate,1,7) as date, COUNT(*) as count  FROM lineitem, orders, customer
WHERE customer.c_name = "Customer#000000020"
AND customer.c_custkey = orders.o_custkey AND orders.o_orderkey = lineitem.l_orderkey
GROUP BY date;