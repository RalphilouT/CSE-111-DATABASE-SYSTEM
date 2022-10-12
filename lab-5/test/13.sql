SELECT o1.o_orderpriority, count( DISTINCT o1.o_orderkey) FROM orders o1, lineitem l1, customer c1
WHERE o1.o_orderkey = l1.l_orderkey AND o1.o_custkey = c1.c_custkey 
AND l1.l_receiptdate < l1.l_commitdate AND o1.o_orderdate BETWEEN '1997-10-01' AND '1997-12-31'
GROUP BY o1.o_orderpriority;