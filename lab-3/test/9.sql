SELECT nation.n_name as nationame, COUNT(*) as count , min(s_acctbal) as minBAL 
FROM nation, supplier
WHERE nation.n_nationkey = supplier.s_nationkey 
GROUP BY nationame
HAVING count > 5;
