SELECT COUNT(c_name) as urgentCOUNT FROM orders, customer, nation
WHERE orders.o_orderpriority = '1-URGENT' AND orders.o_custkey = customer.c_custkey AND
customer.c_nationkey = nation.n_nationkey AND
n_name = 'PERU' AND (o_orderdate BETWEEN '1995-01-01' AND '1997-12-31');