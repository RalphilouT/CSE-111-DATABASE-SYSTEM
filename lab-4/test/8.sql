SELECT DISTINCT n_name, count(DISTINCT o_orderkey) as counts FROM nation, orders,supplier,lineitem
WHERE o_orderkey = l_orderkey AND l_suppkey = s_suppkey AND s_nationkey = n_nationkey
AND substr(o_orderdate,1,4) = '1995' AND o_orderstatus = 'F'
GROUP BY n_name
HAVING counts >50 ;