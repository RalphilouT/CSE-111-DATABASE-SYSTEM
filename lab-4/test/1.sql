SELECT c_name, sum(o_totalprice) FROM customer, nation, orders WHERE o_custkey = c_custkey 
AND c_nationkey = n_nationkey AND n_name = 'FRANCE' AND substr(o_orderdate,1,4)='1995'
GROUP BY c_name;  