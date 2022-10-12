-- SELECT DISTINCT p1.p_name, E1.topTEN FROM part p1, supplier s1, nation n1, partsupp ps1,
-- (SELECT p_name, (ps_supplycost*ps_availqty) as topTEN FROM part, supplier, nation, partsupp
-- WHERE p_partkey = ps_partkey AND ps_suppkey = s_suppkey
-- AND s_nationkey = n_nationkey AND n_name = 'UNITED STATES') AS E1
-- WHERE p1.p_partkey = ps1.ps_partkey AND ps1.ps_suppkey = s1.s_suppkey
-- AND s1.s_nationkey = n1.n_nationkey AND n1.n_name = 'UNITED STATES' AND E1.topTEN = (ps1.ps_availqty * ps1.ps_supplycost)
-- AND E1.p_name = p1.p_name
-- ORDER BY E1.topTEN DESC;


SELECT p1.p_name FROM part p1, supplier s1, nation n1, partsupp ps1,(SELECT max(ps_supplycost*ps_availqty) as totalVALUE, p_name FROM part, supplier, nation, partsupp
WHERE p_partkey = ps_partkey AND ps_suppkey = s_suppkey
AND s_nationkey = n_nationkey AND n_name = 'UNITED STATES' GROUP BY p_name)E1 
WHERE p1.p_partkey = ps1.ps_partkey AND ps1.ps_suppkey = s1.s_suppkey
AND s1.s_nationkey = n1.n_nationkey AND n1.n_name = 'UNITED STATES' AND E1.p_name = p1.p_name  
GROUP BY p1.p_name 
ORDER BY E1.totalVALUE DESC
LIMIT 5;

-- SELECT FROM 
-- WHERE  ;
-- SELECT (ps_supplycost*ps_availqty) AS totalVALUE FROM part, supplier, nation, partsupp
-- WHERE p_partkey = ps_partkey AND ps_suppkey = s_suppkey
-- AND s_nationkey = n_nationkey AND n_name = 'UNITED STATES';


-- totalVALUE IN (ps_supplycost in (SELECT ps_supplycost AS totalVALUE FROM part, supplier, nation, partsupp
-- WHERE p_partkey = ps_partkey AND ps_suppkey = s_suppkey
-- AND s_nationkey = n_nationkey AND n_name = 'UNITED STATES') * ps_availqty in(SELECT ps_availqty AS totalVALUE FROM part, supplier, nation, partsupp
-- WHERE p_partkey = ps_partkey AND ps_suppkey = s_suppkey
-- AND s_nationkey = n_nationkey AND n_name = 'UNITED STATES'))