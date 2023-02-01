use "./../assign01-lib.sml";
use "./../MySolution/assign01-01.sml";

fun rev_helper (xs: 'a xlist, index: int): 'a xlist =
    case xs of
    xlist_nil => xlist_nil
    |
    xlist_cons(x1,xs) =>
    if index = 0
    then xs
    else rev_helper(xlist_snoc(xs,x1), index-1)
    |
    xlist_snoc(xs, x1) =>
    if index = 0
    then xs
    else rev_helper(xlist_cons(x1,xs), index-1)
    |
    xlist_append(xs, ys) =>
    xlist_append(ys, xs)
    |
    xlist_reverse(xs) =>
    xs

fun xlist_remove_reverse(xs: 'a xlist): 'a xlist =
    rev_helper(xs, xlist_size(xs))
    