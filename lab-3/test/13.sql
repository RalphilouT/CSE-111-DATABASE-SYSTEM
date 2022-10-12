SELECT sum(c_acctbal) from customer,nation, region
WHERE customer.c_mktsegment = 'MACHINERY' AND customer.c_nationkey = nation.n_nationkey
AND nation.n_regionkey = region.r_regionkey AND r_name = 'ASIA';
