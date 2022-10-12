SELECT s_name, s_acctbal FROM supplier, nation, region
WHERE supplier.s_nationkey = nation.n_nationkey AND nation.n_regionkey = region.r_regionkey
AND region.r_name = "EUROPE" AND s_acctbal > 7000;