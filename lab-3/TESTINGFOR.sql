SELECT DISTINCT substr(o_orderdate,1,4) as years, COUNT(o_orderdate) as countORDERS FROM orders, supplier, nation, customer, lineitem
WHERE o_orderpriority = '3-MEDIUM' AND orders.o_custkey = customer.c_custkey AND
customer.c_nationkey = nation.n_nationkey AND orders.o_orderkey = lineitem.l_orderkey
GROUP BY o_orderdate
HAVING n_name = 'FRANCE'
inrwe
SELECT DISTINCT substr(o_orderdate,1,4) as years, COUNT(o_orderdate) as countORDERS FROM orders, supplier, nation, customer, lineitem
WHERE o_orderpriority = '3-MEDIUM' AND orders.o_custkey = customer.c_custkey AND
customer.c_nationkey = nation.n_nationkey AND orders.o_orderkey = lineitem.l_orderkey
GROUP BY o_orderdate
HAVING n_name = 'GERMANY';