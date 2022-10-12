SELECT DISTINCT substr(o_orderdate,1,4) as years,  COUNT(l_receiptdate) as countORDERS 
FROM orders, supplier, nation, lineitem
WHERE orders.o_orderkey = lineitem.l_orderkey AND
lineitem.l_suppkey = supplier.s_suppkey AND supplier.s_nationkey = nation.n_nationkey AND
o_orderpriority = '3-MEDIUM' AND (nation.n_name = 'GERMANY' or nation.n_name = 'FRANCE')
GROUP BY years;

