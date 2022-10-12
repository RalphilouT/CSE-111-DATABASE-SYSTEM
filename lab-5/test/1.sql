SELECT count(c_custkey) FROM customer, nation, region
WHERE c_nationkey = n_nationkey AND n_regionkey = r_regionkey
AND r_name <> 'EUROPE'AND r_name <> 'AFRICA' AND r_name <> 'ASIA';