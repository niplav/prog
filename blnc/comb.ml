let numof l n=List.length (List.filter (fun x -> x=n) l)

let join l s=List.fold_right (fun x r -> if r="" then x else x^s^r) l ""

let rev_tr l=
        let rec imp acc l=match l with
                | [] -> acc
                | v::r -> (imp (v::acc) r)
        in
        imp [] l

let append_tr l1 l2=
        let rec imp l1 l2=match l1 with
                | [] -> l2
                | v::r -> imp r (v::l2)
        in
        imp (rev_tr l1) l2

let map_tr f l=
	let rec imp acc l=match l with
		| [] -> acc
		| v::r -> imp ((f v)::acc) r
	in
	rev_tr (imp [] l)

let rec comb l=let
	same=List.filter (fun l -> (numof l 1)=(numof l 0)) l and
	diff=List.filter (fun l -> (numof l 1)<>(numof l 0)) l in
	let _=map_tr (fun l -> print_string ((join (map_tr (string_of_int) l) "")^"\n")) same in
	comb (append_tr (map_tr (fun x -> 0::x) diff) (map_tr (fun x -> 1::x) diff))

let ()=comb[[1];[0]]
