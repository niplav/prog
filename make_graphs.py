def make_graphs(n=2, i=None, j=None):
	"""Make a graph recursively, by either including, or skipping each edge.
	Edges are given in lexicographical order by construction."""
	out = []
	if i is None: # First call

		out  = [[(0,1)]+r for r in make_graphs(n=n, i=0, j=1)]
	elif j<n-1:
		out += [[(i,j+1)]+r for r in make_graphs(n=n, i=i, j=j+1)]
		out += [		  r for r in make_graphs(n=n, i=i, j=j+1)]
	elif i<n-1:
		out = make_graphs(n=n, i=i+1, j=i+1)
	else:
		out = [[]]
	return out
