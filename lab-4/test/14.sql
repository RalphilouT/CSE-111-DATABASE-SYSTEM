
SELECT t.r_name,o.r_name, max(o_totalprice) FROM region o, region t,orders,  customer ,supplier,lineitem ,nation a, nation b
WHERE o.r_regionkey = b.n_regionkey AND b.n_nationkey = c_nationkey AND c_custkey = o_custkey
AND t.r_regionkey = a.n_regionkey AND a.n_nationkey = s_nationkey AND s_suppkey = l_suppkey AND l_orderkey = o_orderkey 
GROUP BY t.r_name,o.r_name;


