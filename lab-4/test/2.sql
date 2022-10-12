SELECT r_name, count(*) FROM supplier, nation, region 
WHERE s_nationkey = n_nationkey AND n_regionkey = r_regionkey
GROUP BY r_name;