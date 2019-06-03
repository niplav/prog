function ntation(n, m, ar)
	local a=n
	if ar==1 then
		a=n+m
	elseif ar==2 then
		a=n*m
	elseif ar==3 then
		a=n^m
	else
		for i=1, m-1 do a=ntation(n, a, ar-1) end
	end
	return a
end
