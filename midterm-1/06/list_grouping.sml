(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-02: midterm-06: 20 points
//
Given a list of integers xs, list_grouping(xs)
returns a list of pairs (n, x) where n indicates
the number of times x occurs in xs; for each x in
xs, there must be a pair (n, x) for some n in the
returned list.
//
For instance,
list_grouping([1,2]) = [[1,1], [1,2]]
list_grouping([1,2,2,2,1]) = [[2,1], [3,2]]
list_grouping([1,2,1,2,3]) = [[2,1], [2,2], [1,3]]
//
In order to receive full credit, your implementation
should be able to handle a list containing 1M elements
in less than 10 seconds (mine can do it in less than
two seconds)
//
*)
(* ****** ****** *)
val
int_max =
fn(x, y) => if x >= y then x else y

val
intmin =
fn(x, y) => if x <= y then x else y

fun count_Num(x: int, xs: int list): int =
      list_length(list_filter(xs, fn y => x = y))

fun build_pair(x: int, xs: int list): (int * int) =
      (count_Num(x, xs), x)

fun build_grouping(xs: int list): (int * int) list =
      list_map(
        list_reduce_left(xs, [], fn(acc, x) => if list_exists(acc, fn (n, y) => x = y) then acc else list_extend(acc, build_pair(x, xs))),
        fn (n, x) => build_pair(x, xs))
	
fun list_grouping(xs: int list): (int * int) list =
  build_grouping(xs)
  

(* ****** ****** *)

(*
Some testing code:
val N = 1000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*)
(* ****** ****** *)

(*
Some testing code:
Your implementation needs to be efficient to pass the
following test:
val N = 1000000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_grouping.sml] *)
