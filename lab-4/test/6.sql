SELECT s_name, o_orderpriority, count(DISTINCT p_partkey) FROM supplier, orders, part, nation,partsupp,lineitem
WHERE  s_nationkey = n_nationkey AND n_name = 'CANADA' AND ps_suppkey = s_suppkey
AND ps_partkey = p_partkey AND l_suppkey = s_suppkey AND l_partkey = p_partkey
AND l_orderkey = o_orderkey
GROUP BY s_name,o_orderpriority;