SELECT n_name, max(s_acctbal) as maxBal FROM supplier, nation
WHERE s_nationkey = n_nationkey
GROUP BY n_name
HAVING maxBal > 9000;