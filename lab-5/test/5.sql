SELECT s_name, p_size, min( DISTINCT ps_supplycost) AS minCOST FROM part, partsupp, supplier, nation, region
WHERE p_type LIKE '%STEEL' AND p_partkey = ps_partkey AND r_name = 'ASIA'
AND r_regionkey = n_regionkey AND n_nationkey = s_nationkey
AND s_suppkey = ps_suppkey
GROUP BY p_size
ORDER BY s_name ASC,p_size ASC; 

-- GROUP BY p_size
-- ORDER BY s_name, p_size,minCOST;