SELECT sum(o_totalprice) FROM orders, customer, nation, region
WHERE orders.o_custkey = customer.c_custkey AND customer.c_nationkey = n_nationkey 
AND nation.n_regionkey = region.r_regionkey AND substr(o_orderdate,1,4) = '1997' AND region.r_name = 'ASIA'
GROUP BY region.r_name; 