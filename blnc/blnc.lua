local families, giveup, ratio, exct=100000, 100, 515, 1000
local boys, girls, children=0, 0, 0
local j=0

if #arg>=1 then giveup=arg[1]+0 end

math.randomseed(os.time())

for i=1, families do
	while (boys==0 or girls==0 or boys~=girls) and (boys+girls<giveup) do
		if math.random(1, exct)<=ratio then boys=boys+1 else girls=girls+1 end
	end
	if boys==girls then children=children+boys+girls j=j+1 end
	boys, girls=0, 0
end

print("families: " .. families .. ",", "give up at: " .. giveup .. ",", "sex ratio: " .. ratio .. ":" .. (exct-ratio))
print("child avg: " .. (children/families), "give up: " .. ((1-j/families)*100) .. "%")
