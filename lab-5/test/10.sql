-- SELECT r_name, count(DISTINCT c1.c_custkey)FROM customer c1, nation n1, region r1, orders o1,
-- (SELECT avg(c_acctbal) as avgBal FROM customer)E1
-- WHERE c1.c_acctbal < E1.avgBal AND o1.o_custkey = c1.c_custkey AND c1.c_nationkey = n1.n_nationkey
-- AND n1.n_regionkey = r1.r_regionkey AND c1.c_custkey NOT IN (SELECT o_custkey FROM orders)
-- GROUP BY r_name; 
-- SELECT A.* FROM A WHERE NOT EXISTS(SELECT 1 FROM B WHERE B.ID=A.ID)
SELECT r_name, count(DISTINCT c1.c_custkey)FROM customer c1, nation n1, region r1, orders o1,
(SELECT avg(c_acctbal) as avgBal FROM customer)E1
WHERE NOT EXISTS (SELECT 1 FROM orders o2 WHERE c1.c_custkey = o2.o_custkey)
AND c1.c_acctbal < E1.avgBal AND c1.c_nationkey = n1.n_nationkey
AND n1.n_regionkey = r1.r_regionkey
GROUP BY r_name; 

-- SELECT DISTINCT r_name, COUNT(c_custkey) from customer
-- WHERE NOT EXISTS (SELECT 1 FROM orders WHERE customer.c_custkey = orders.o_custkey)
-- AND ;