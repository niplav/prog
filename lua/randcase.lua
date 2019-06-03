function randbool()
	return (math.random()>0.5)
end

function randcase(s)
	local r=""
	for i=1,#s do
		r=randbool() and r..string.upper(s:sub(i, i)) or r..string.lower(s:sub(i, i))
	end
	return r
end
