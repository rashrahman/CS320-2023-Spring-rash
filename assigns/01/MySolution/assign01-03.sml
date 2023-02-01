use "./../assign01-lib.sml";
use "./../MySolution/assign01-01.sml";


fun xlist_remove_reverse (xs: 'a xlist): 'a xlist =
    let
    fun rev_helper (xs: 'a xlist): 'a xlist =
    	case xs of
    	xlist_nil => xlist_nil
    	|
    	xlist_cons(x1,xs) =>
    	xlist_snoc(rev_helper(xs), x1)
    	|
    	xlist_snoc(xs, x1) =>
    	xlist_cons(x1, rev_helper(xs))
    	|
    	xlist_append(xs, ys) =>
    	xlist_append(rev_helper(ys), rev_helper(xs))
    	|
    	xlist_reverse(xs) =>
    	xs

    in
	case xs of
    	xlist_nil =>xlist_nil
    	|
    	xlist_cons(x1,xs) =>
	xlist_cons(x1, xlist_remove_reverse(xs))
    	|
    	xlist_snoc(xs, x1) =>
	xlist_snoc(xlist_remove_reverse(xs), x1)
    	|
    	xlist_append(xs,ys) =>
	xlist_append(xlist_remove_reverse(xs), xlist_remove_reverse(ys))
   	|
    	xlist_reverse(xs) => rev_helper(xs)
    end