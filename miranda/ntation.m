%export nta

||perform an arithmetic operation of grade ar on two numbers
||This one gives a segfault.
||I thought miranda was supposed to be memory safe ;)

nta n m 1 = n + m
nta n m 2 = n * m
nta n m 3 = n ^ m
nta n m ar = foldr (nta (ar-1)) 1 (rep m n)
