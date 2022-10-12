SELECT DISTINCT n_name FROM nation, customer, orders 
WHERE nation.n_nationkey = customer.c_nationkey AND orders.o_custkey = customer.c_custkey 
AND (o_orderdate = '1994-09-09' or o_orderdate = '1994-09-10' or o_orderdate = '1994-09-11') 
ORDER BY n_name;