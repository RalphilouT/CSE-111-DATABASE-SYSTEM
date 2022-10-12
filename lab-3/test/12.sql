SELECT r_name, COUNT(*) as pstatus from region, orders, customer, nation
WHERE o_orderstatus = 'P' AND orders.o_custkey =  customer.c_custkey
AND customer.c_nationkey =  nation.n_nationkey AND nation.n_regionkey = region.r_regionkey
GROUP BY r_name;