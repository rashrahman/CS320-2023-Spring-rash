(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
list_range(x, y) returns a list consisting
of all the integers i satisfying x <= i < y.
//
For instance,
list_range(1, 1) = []
list_range(2, 1) = []
list_range(0, 5) = [0,1,2,3,4]
//
Please give a tail-recusive implementation of
the list_range function
//
*)
fun helper(start: int, finish: int, newList: int list): int list =
 if start >= finish
 then newList
 else helper(start, finish-1, finish-1::newList )

fun list_range(start: int, finish: int): int list =
 helper(start, finish, [])


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-02.sml] *)
