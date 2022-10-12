-- SELECT sum(ps1.ps_supplycost) FROM partsupp ps1, part p1, lineitem l1, supplier s1 
-- WHERE ps1.ps_partkey = p1.p_partkey AND p1.p_retailprice < 1000 AND p1.p_partkey = l1.l_partkey
-- AND l1.l_shipdate LIKE '1997%' AND l1.l_suppkey = s1.s_suppkey 
-- AND (NOT EXISTS (SELECT 1 FROM lineitem l2 WHERE  s1.s_suppkey = l2.l_suppkey AND l2.l_extendedprice < 2000 
-- AND l2.l_commitdate LIKE '1996%'));

-- SELECT sum(DISTINCT ps1.ps_supplycost) FROM partsupp ps1, part p1, lineitem l1
-- WHERE ps1.ps_partkey = p1.p_partkey AND p1.p_retailprice < 1000 AND p1.p_partkey = l1.l_partkey
-- AND l1.l_shipdate LIKE '1997%' 
-- AND l1.l_suppkey NOT IN (SELECT s2.s_suppkey FROM supplier s2 WHERE s2.s_suppkey = l1.l_suppkey AND l1.l_extendedprice < 2000 
-- AND l1.l_commitdate  LIKE '1996%');


SELECT  sum(ps1.ps_supplycost) FROM partsupp ps1, part p1, lineitem l1
WHERE ps1.ps_partkey = l1.l_partkey AND p1.p_retailprice < 1000 AND p1.p_partkey = ps1.ps_partkey
AND l1.l_shipdate LIKE '1997%'
AND ps1.ps_suppkey NOT IN (SELECT l2.l_suppkey FROM lineitem l2 WHERE l2.l_extendedprice < 2000 
AND l2.l_shipdate LIKE '1996%' );

-- SELECT sum(ps1.ps_supplycost) FROM partsupp ps1, part p1, lineitem l1, supplier s1 
-- WHERE ps1.ps_partkey = p1.p_partkey AND p1.p_retailprice < 1000 AND ps1.ps_partkey = l1.l_partkey
-- AND l1.l_shipdate LIKE '1997%' AND l1.l_suppkey = s1.s_suppkey 
-- AND NOT (EXISTS (SELECT 1 FROM lineitem l2 WHERE  s1.s_suppkey = l2.l_suppkey) AND (SELECT 1 FROM lineitem l2 WHERE AND l2.l_extendedprice < 2000 );


-- SELECT SUM(DISTINCT ps1.ps_supplycost) FROM partsupp ps1, part p1, lineitem l1, supplier s1 
-- WHERE ps1.ps_partkey = p1.p_partkey AND p1.p_retailprice < 1000 AND ps1.ps_partkey = l1.l_partkey
-- AND l1.l_shipdate LIKE '1997%' AND l1.l_suppkey = s1.s_suppkey 
-- AND s_suppkey NOT IN (SELECT s2.s_suppkey FROM supplier s2 WHERE s2.s_suppkey = l1.l_suppkey AND l1.l_extendedprice > 2000 AND l1.l_commitdate NOT LIKE '1996%')
-- ;

-- SELECT SUM(DISTINCT ps1.ps_supplycost) FROM partsupp ps1, part p1, lineitem l1, supplier s1 
-- WHERE ps1.ps_partkey = p1.p_partkey AND p1.p_retailprice < 1000 AND ps1.ps_partkey = l1.l_partkey
-- AND l1.l_shipdate LIKE '1997%' AND l1.l_suppkey = s1.s_suppkey 
-- AND s_suppkey NOT IN (SELECT s2.s_suppkey FROM supplier s2,lineitem l2 WHERE s2.s_suppkey = l1.l_suppkey AND l2.l_extendedprice < 2000 AND l2.l_commitdate LIKE '1996%'
-- AND l2.l_suppkey = s2.s_suppkey)
-- ;

-- SELECT sum(DISTINCT ps1.ps_supplycost) FROM partsupp ps1, part p1, lineitem l1, supplier s1, lineitem l11
-- WHERE NOT EXISTS (SELECT 1 FROM lineitem l2 WHERE s1.s_suppkey = l2.l_suppkey AND l2.l_extendedprice < 2000 AND l2.l_shipdate LIKE '1996%')
-- AND ps1.ps_partkey = p1.p_partkey AND p1.p_retailprice < 1000 AND ps1.ps_partkey = l1.l_partkey AND l1.l_suppkey = s1.s_suppkey
-- AND l1.l_shipdate LIKE '1997%';

-- (SELECT 1 FROM lineitem l2 WHERE l2.l_extendedprice < 2000 AND substr(l2.l_shipdate,1,4) = '1996')
-- (SELECT 
-- s2.s_name FROM supplier s2, lineitem l2 WHERE 
-- NOT EXISTS (SELECT 1 FROM supplier s3 WHERE s3.s_suppkey = l2.l_suppkey AND l2.l_extendedprice < 2000 AND substr(l2.l_shipdate,1,4) = '1996' )
-- )E1

-- SELECT sum(DISTINCT ps1.ps_supplycost) FROM 
-- supplier s1 LEFT JOIN lineitem l1 ON (l1.l_suppkey = s1.s_suppkey AND l1.l_extendedprice < 2000 AND l1.l_shipdate LIKE '1996%')
-- JOIN partsupp ps1 ON ps1.ps_suppkey = s1.s_suppkey
-- JOIN part p1 ON p1.p_partkey = ps1.ps_partkey
-- JOIN lineitem l2 ON l2.l_suppkey = p1.p_partkey
-- WHERE p1.p_retailprice < 1000 AND l2.l_shipdate LIKE '1997%' AND l1.l_suppkey IS NULL ;
 
-- SELECT sum(DISTINCT ps1.ps_supplycost) FROM partsupp ps1, part p1, lineitem l1, supplier s1, lineitem l11
-- WHERE NOT (EXISTS (SELECT 1 FROM lineitem l2 WHERE s1.s_suppkey = l2.l_suppkey AND l2.l_extendedprice < 2000)
-- AND EXISTS (SELECT 1 FROM lineitem l2 WHERE l2.l_extendedprice < 2000)
-- -- AND EXISTS (SELECT 1 from lineitem l2 WHERE l2.l_shipdate LIKE '1996%'))

-- SELECT sum(DISTINCT ps1.ps_supplycost) FROM partsupp ps1, part p1, lineitem l1, supplier s1, 
-- (SELECT DISTINCT s2.s_suppkey FROM  lineitem l2, supplier s2 WHERE 
-- l2.l_extendedprice < 2000 AND l2.l_shipdate LIKE '1996%' AND l2.l_suppkey = s2.s_suppkey)E1
-- WHERE ps1.ps_partkey = p1.p_partkey AND p1.p_retailprice < 1000 AND ps1.ps_partkey = l1.l_partkey
-- AND l1.l_shipdate LIKE '1997%' AND s1.s_suppkey <> E1.s_suppkey;


--(NOT EXISTS (SELECT 1 FROM supplier s3 WHERE s3.s_suppkey = l2.l_suppkey) OR
-- (l2.l_extendedprice < 2000 AND l2.l_shipdate LIKE '1996%') 