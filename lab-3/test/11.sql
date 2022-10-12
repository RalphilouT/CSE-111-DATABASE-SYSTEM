SELECT COUNT(DISTINCT o_custkey) as countnum FROM lineitem, customer,orders
WHERE l_discount >=  0.07 AND lineitem.l_orderkey = orders.o_orderkey AND orders.o_custkey = customer.c_custkey;


