SELECT c_name, count(o_orderkey) FROM customer, nation, orders
WHERE c_nationkey = n_nationkey AND n_name = 'GERMANY'
AND substr(o_orderdate,1,4)='1993' AND c_custkey = o_custkey
GROUP BY c_name;