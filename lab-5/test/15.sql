-- SELECT sum( l1.l_extendedprice*(1-l1.l_discount)) as revenueL FROM lineitem l1, orders o1,
-- (SELECT  c2.c_custkey FROM customer c2, nation n2, region r2
-- WHERE r2.r_name = 'ASIA' AND r2.r_regionkey = n2.n_regionkey AND n2.n_nationkey = c2.c_nationkey)E1, 
-- (SELECT  s3.s_suppkey FROM nation n3, supplier s3
-- WHERE n3.n_name = 'UNITED STATES' AND n3.n_nationkey = s3.s_nationkey)E2
-- WHERE o1.o_orderkey = l1.l_orderkey AND E1.c_custkey = o1.o_custkey AND l1.l_suppkey =  E2.s_suppkey AND
-- l1.l_shipdate LIKE '1997%';
-- united state suppliers
-- asia customers


SELECT E2.rev/E1.rev as revenueL FROM 
(SELECT sum( l2.l_extendedprice*(1-l2.l_discount)) as rev ,c2.c_custkey FROM lineitem l2, customer c2, nation n2, region r2, orders o2
WHERE r2.r_name = 'ASIA' AND r2.r_regionkey = n2.n_regionkey AND n2.n_nationkey = c2.c_nationkey
AND c2.c_custkey = o2.o_custkey AND l2.l_orderkey = o2.o_orderkey AND l2.l_shipdate LIKE '1997%')E1, 
(SELECT sum( l3.l_extendedprice*(1-l3.l_discount))as rev, s3.s_suppkey FROM lineitem l3,nation n3, supplier s3, nation n4,region r3, customer c3, orders o3
WHERE n3.n_name = 'UNITED STATES' AND n3.n_nationkey = s3.s_nationkey AND s3.s_suppkey = l3.l_suppkey AND l3.l_shipdate LIKE '1997%'
AND r3.r_name = 'ASIA' AND r3.r_regionkey = n4.n_regionkey AND n4.n_nationkey = c3.c_nationkey AND c3.c_custkey = o3.o_custkey AND o3.o_orderkey = l3.l_orderkey)E2;


