SELECT p_mfgr FROM part p1, supplier s1, partsupp ps1, (SELECT min(ps_availqty) as minVALUE FROM part p1, supplier s1, partsupp ps1  
WHERE s1.s_name = 'Supplier#000000010'
AND s1.s_suppkey = ps1.ps_suppkey AND ps1.ps_partkey = p1.p_partkey)E1
WHERE s1.s_name = 'Supplier#000000010'
AND s1.s_suppkey = ps1.ps_suppkey AND ps1.ps_partkey = p1.p_partkey AND E1.minVALUE = ps1.ps_availqty;