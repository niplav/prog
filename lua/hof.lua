function map(t, f)
	local res={}
	for i=1, #a do
		res[i]=f(t[i])
	end
	return res
end

function filter(t, f)
	local res={}
	local resi=1
	for i=1, #a do
		if f(t[i])==true then
			res[resi]=t[i]
			resi=resi+i
		end
	end
	return res
end

function foldr(t, f)
	local res=t[#a]
	for i=#a-1, 1, -1 do
		res=f(t[i], res)
	end
	return res
end

function foldl(t, f)
	local res=t[1]
	for i=2, #a do
		res=f(t[i], res)
	end
	return res
end
