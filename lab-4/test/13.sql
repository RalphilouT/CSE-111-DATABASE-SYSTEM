SELECT count(l_orderkey) as countO FROM lineitem , orders, nation u,nation a,customer,region,supplier
WHERE r_name= 'AFRICA' AND r_regionkey= a.n_regionkey AND a.n_nationkey = s_nationkey 
AND s_suppkey = l_suppkey AND u.n_name = 'UNITED STATES' AND u.n_nationkey = c_nationkey AND c_custkey = o_custkey
AND o_orderkey = l_orderkey;
   
