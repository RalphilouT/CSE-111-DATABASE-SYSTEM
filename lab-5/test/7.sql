SELECT o_orderpriority, count(p_partkey) FROM orders, part, lineitem
WHERE p_partkey = l_partkey AND l_orderkey = o_orderkey AND o_orderdate LIKE '1997%'
AND l_receiptdate > l_commitdate
GROUP BY o_orderpriority;