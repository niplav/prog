from math import factorial as fac


def binomial(x, y):
	try:
		binom = fac(x) // fac(y) // fac(x - y)
	except ValueError:
		binom = 0
	return binom

def s1(x):
	return binomial(2*x, x)/(1+x)

def s2(x):
	if x==0:
		return 1
	else:
		return (2*(2*x+1))/(x+2)*s2(x-1)

def s3(x):
        if x==0:
                return 1
        else:
                return ((2*(2*x-1))/(x+1))*s3(x-1)

arg=list(range(0,13))
print(list(map(s1,arg)))
print(list(map(s2,arg)))
print(list(map(s3,arg)))
