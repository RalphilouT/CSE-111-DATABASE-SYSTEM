SELECT n_name, o_orderstatus, count(DISTINCT o_orderkey) FROM nation, orders, customer, region
WHERE o_custkey = c_custkey AND c_nationkey = n_nationkey AND n_regionkey = r_regionkey
AND r_name = 'AMERICA'
GROUP BY n_name, o_orderstatus;