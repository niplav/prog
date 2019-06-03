#!/usr/bin/env perl6

my $text=slurp.subst(/\n|\t/, "", :g);
my @twomatch;
my @chars=$text.split("").sort.unique;
my %twomatches;

for @chars -> $char
{
	my @twomatch=comb(/$char./, $text).unique;
	if @twomatch.elems > 1
	{
		for @twomatch -> $pair
		{
			say "$pair";
		}
	}
}
