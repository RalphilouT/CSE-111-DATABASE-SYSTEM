SELECT l_receiptdate, l_returnflag, l_extendedprice, l_tax from lineitem WHERE l_returnflag = 'R' AND l_receiptdate = '1993-09-09'; 