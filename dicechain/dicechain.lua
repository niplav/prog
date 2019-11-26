function randint(low, high)
	return math.ceil((1+high-low)*math.random())
end

function throw(dicenum, low, high)
	local sum=0
	for i=1, dicenum do
		sum=sum+randint(low, high)
	end
	return sum
end

function chainlen(dicenum, low, high)
	local len=-1
	local lastthrow=-1
	local nextthrow=0
	while lastthrow<nextthrow do
		lastthrow=nextthrow
		nextthrow=throw(dicenum, low, high)
		len=len+1
	end
	return len
end

function avgchainlen(tries, dicenum, low, high)
	local n=0
	local sum=0
	for i=0, tries do
		local imdt=chainlen(dicenum, low, high)
		sum=sum+imdt
		n=n+1
	end
	return sum/n
end

math.randomseed(os.time())

for d=1, 100 do
	print(avgchainlen(1000000, d, 1, 6), d)
end
