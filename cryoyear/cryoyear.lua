#TODO: pr_death_before to be filled with correct values
#TODO: give alcor cost

pr_success=0.06
life_year_value=50000
life_expct=80
expct_years_gain=80
pr_death_before={[30]=0.01;[40]=0.1;[50]=0.2;[60]=0.2;[70]=0.4;[80]=0.5;[90]=0.8;[100]=0.95}

function cost_from_age(age)
	return insurance_cost(age)+membership_cost(age)
end

function insurance_cost(age)
	return 30000
end

function membership_cost(age)
	return 20000
end

function gain_from_age(age)
	return (pr_success*expct_years_gain*life_year_value)*(1-pr_death_before[age])
end
