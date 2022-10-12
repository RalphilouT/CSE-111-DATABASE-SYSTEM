SELECT DISTINCT n_name, count(DISTINCT o_orderkey) FROM nation, orders, customer,supplier,region
WHERE c_custkey = o_custkey AND c_nationkey = n_nationkey AND n_regionkey = r_regionkey
AND r_name = 'AMERICA'
GROUP BY n_name;