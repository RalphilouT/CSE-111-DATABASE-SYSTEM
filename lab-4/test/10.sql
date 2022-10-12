SELECT p_type, min(l_discount), max(l_discount) FROM part, lineitem
WHERE p_partkey = l_partkey AND p_type LIKE 'ECONOMY_%_COPPER'
GROUP BY p_type;