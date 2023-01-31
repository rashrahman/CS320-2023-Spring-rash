
use "./../assign01-lib.sml";
use "./../MySolution/assign01-01.sml";

fun sub_helper(xs: 'a xlist, i0: int): 'a=

   case xs of
   xlist_nil => raise XlistSubscript
   |
   xlist_cons(x1, xs) =>
    if i0 = 0
    then x1
    else sub_helper(xs, i0-1)
   |
   xlist_snoc(xs, x1) =>
    if i0 = xlist_size(xs)-1
    then x1
    else sub_helper(xs, i0+1)
   |
   xlist_append(xs, ys) =>
    if i0 < xlist_size(xs)
    then sub_helper(xs, i0)
    else sub_helper(ys, i0 - xlist_size(xs))
   |
   xlist_reverse(xs) => sub_helper(xs, xlist_size(xs)- i0 -1)
    
	

fun xlist_sub(xs: 'a xlist, i0: int): 'a =
    sub_helper(xs, i0)