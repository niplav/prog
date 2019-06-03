let rev_tr l=
	let rec imp acc l=match l with
		| [] -> acc
		| v::r -> (imp (v::acc) r)
	in
	imp [] l

let append_tr l1 l2=
	let rec imp l1 l2=match l1 with
		| [] -> l2
		| v::r -> (imp r v::l2)
	in
	imp (rev_tr l1) l2
