use "./../assign01-lib.sml";
val list_append = op@
val list_reverse = List.rev
(* ****** ****** *)

exception XlistConsMatch
exception XlistSubscript

(* ****** ****** *)

datatype 'a xlist =
xlist_nil
|
xlist_cons of ('a * 'a xlist)
|
xlist_snoc of ('a xlist * 'a)
|
xlist_append of ('a xlist * 'a xlist)
|
xlist_reverse of ('a xlist)

(* ****** ****** *)

fun
list_of_xlist(xs: 'a xlist): 'a list =
(
case xs of
xlist_nil => []
|
xlist_cons(x1, xs) => x1 :: list_of_xlist(xs)
|
xlist_snoc(xs, x1) => list_of_xlist(xs) @ [x1]
|
xlist_append(xs, ys) => list_of_xlist(xs) @ list_of_xlist(ys)
|
xlist_reverse(xs) => list_reverse(list_of_xlist(xs))
)

fun size_helper(xs: 'a xlist, count: int): int=
    case xs of
    xlist_nil => count
    |
    xlist_cons(x1,xs) => size_helper(xs, count+1)
    |
    xlist_snoc(xs, x1) => size_helper(xs, count+1)
    |
    xlist_append(xs, ys) => size_helper(xs, count) + size_helper(ys, 0)
    |
    xlist_reverse(xs) => size_helper(xs, count)

fun xlist_size(xs: 'a xlist): int =
    size_helper(xs, 0)