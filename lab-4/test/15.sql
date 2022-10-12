SELECT count(DISTINCT o_orderkey) FROM orders, customer, supplier,lineitem
WHERE s_suppkey = l_suppkey AND l_orderkey = o_orderkey 
AND s_acctbal < 0 AND c_custkey = o_custkey AND c_acctbal > 0;