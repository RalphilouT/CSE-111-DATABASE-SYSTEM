SELECT count(DISTINCT o_clerk) FROM orders, supplier,nation,customer,lineitem
WHERE s_nationkey = n_nationkey AND n_name = 'UNITED STATES' 
AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey;