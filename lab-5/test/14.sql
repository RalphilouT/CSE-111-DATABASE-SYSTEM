SELECT  E1.r_name, E2.r_name,substr(l1.l_shipdate,1,4) as years, sum( l1.l_extendedprice*(1-l1.l_discount))  FROM lineitem l1, orders o1,
(SELECT r2.r_name, s2.s_suppkey FROM  supplier s2, region r2, nation n2
WHERE r2.r_regionkey = n2.n_regionkey AND n2.n_nationkey = s2.s_nationkey)E1,
(SELECT r3.r_name, c3.c_custkey  FROM customer c3, region r3, nation n3
WHERE r3.r_regionkey = n3.n_regionkey AND n3.n_nationkey = c3.c_nationkey)E2
WHERE l1.l_orderkey = o1.o_orderkey AND o1.o_custkey = E2.c_custkey AND l1.l_suppkey = E1.s_suppkey AND l1.l_shipdate LIKE '1996%'
GROUP BY E1.r_name, E2.r_name 
UNION
SELECT  E1.r_name, E2.r_name,substr(l1.l_shipdate,1,4) as years, sum( l1.l_extendedprice*(1-l1.l_discount))  FROM lineitem l1, orders o1,
(SELECT r2.r_name, s2.s_suppkey FROM supplier s2, region r2, nation n2
WHERE r2.r_regionkey = n2.n_regionkey AND n2.n_nationkey = s2.s_nationkey)E1,
(SELECT r3.r_name, c3.c_custkey  FROM customer c3, region r3, nation n3
WHERE r3.r_regionkey = n3.n_regionkey AND n3.n_nationkey = c3.c_nationkey)E2
WHERE l1.l_orderkey = o1.o_orderkey AND o1.o_custkey = E2.c_custkey AND l1.l_suppkey = E1.s_suppkey AND l1.l_shipdate LIKE '1997%'
GROUP BY E1.r_name, E2.r_name;