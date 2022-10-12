SELECT n_name, count(DISTINCT c_custkey), count(DISTINCT s_suppkey) FROM region, nation, supplier, customer
WHERE r_name = 'AFRICA' AND r_regionkey = n_regionkey AND n_nationkey = s_nationkey
AND n_nationkey = c_nationkey
GROUP BY n_name;