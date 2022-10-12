-- SELECT r_name, count(DISTINCT S1.s_suppkey),avg(S1.s_acctbal), S2.s_acctbal FROM region, nation , supplier S1, supplier S2
-- WHERE  r_regionkey = n_regionkey AND n_nationkey = S1.s_nationkey AND S2.s_nationkey = n_nationkey
-- GROUP BY r_name
-- HAVING avg(S1.s_acctbal) > S2.s_acctbal;

-- SELECT r_name, avg(DISTINCT s_acctbal)  FROM  region, nation , supplier 
-- WHERE  r_regionkey = n_regionkey AND n_nationkey = s_nationkey
-- GROUP BY r_name;

-- SELECT r_name,s_acctbal FROM  region, nation , supplier 
-- WHERE  r_regionkey = n_regionkey AND n_nationkey = s_nationkey;

SELECT E1.r_name, count(DISTINCT E2.s_acctbal) FROM (SELECT r_name, avg(DISTINCT s_acctbal) as AVERAGE FROM  region, nation , supplier 
WHERE  r_regionkey = n_regionkey AND n_nationkey = s_nationkey
GROUP BY r_name)E1, (SELECT r_name, s_acctbal FROM  region, nation , supplier 
WHERE  r_regionkey = n_regionkey AND n_nationkey = s_nationkey)E2
WHERE E1.AVERAGE > E2.s_acctbal AND E1.r_name = E2.r_name
GROUP BY E1.r_name;

-- SELECT r_name, s_acctbal,count(DISTINCT s_acctbal) FROM  region, nation , supplier 
-- WHERE  r_regionkey = n_regionkey AND n_nationkey = s_nationkey 
-- AND s_acctbal < (SELECT avg(s_acctbal) FROM supplier, nation, region
-- WHERE r_regionkey = n_regionkey AND n_nationkey = s_nationkey
-- GROUP BY r_name)
-- GROUP BY r_name;

-- SELECT r1.r_name, count(DISTINCT s1.s_suppkey) FROM region r1, nation n1, supplier s1,
-- (SELECT DISTINCT n_nationkey, avg(s_acctbal) as AVERAGE FROM  region, nation , supplier 
-- WHERE  r_regionkey = n_regionkey AND n_nationkey = s_nationkey)result
-- WHERE  r1.r_regionkey = n1.n_regionkey AND n1.n_nationkey = s1.s_nationkey
-- GROUP BY r1.r_name
-- HAVING s1.s_acctbal < result.AVERAGE;

-- SELECT r_name,count(DISTINCT s_acctbal) AS counts  FROM  region, nation , supplier, 

