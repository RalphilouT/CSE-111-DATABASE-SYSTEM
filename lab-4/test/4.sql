SELECT s_name, count(p_size) FROM supplier, nation,  part, partsupp
WHERE ps_suppkey = s_suppkey AND s_nationkey = n_nationkey AND ps_partkey = p_partkey
AND n_name = 'CANADA' AND p_size < 20
GROUP BY s_name;