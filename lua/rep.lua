function rep(m, n)
	a={}
	for i=1, n do
		a[i]=m
	end
	return a
end

function seq(m, n)
	a={}
	for i=1, n-m do
		a[i]=n-1+i
	end
	return a
end
