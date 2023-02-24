(* ****** ****** *)
(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-02-16: 10 point
The function [list_subsets]
returns all the subsets of a given
set (where sets are represented as lists)
//

//
Please give a NON-RECURSIVE implementation of
list_subsets based on list-combinators. Note that
the order of the elements in a list representation
of a set is insignificant.
//
*)
(* ****** ****** *)


val list_subsets = fn(xs: 'a list) =>
    if list_length(xs) =0
    then [[]]
    else if list_length(xs) =1
    then [xs]
    else list_foldleft(xs, [[]], fn(x1,x2) => x1 @ list_map(x1, fn(xs) => x2::xs)) 

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-02.sml] *)
