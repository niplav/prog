%export rand shuf

||Why even bother?

rand :: num
rand = code (read ("/dev/urandom")!0)

||This doesn't work. It makes a »sort-of« pseudo-shuffle, not the expected.
||I guess this is due to a reusing of values read from /dev/urandom in rand.

shuf :: [*] -> [*]
shuf [] = []

||use something like (take x-1 a)++(take x+1 a)?
shuf a = x : shuf (a--[x])
	 where
	 x = a!(rand mod #a)
