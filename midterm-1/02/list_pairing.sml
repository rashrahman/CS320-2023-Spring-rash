(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-01: 10 points
*)
(* ****** ****** *)
(*
Given a list xs, list_pairing(xs) returns
a list of pairs and an option; the 1st pair
consists of the first and last elements in xs,
and the 2nd pair consists of the second and the
second last elements in xs, and so on and so forth;
and the option is NONE if |xs| is even, and it is
SOME(xm) if |xs| is odd and xm is the middle element
in xs.
//
For instance, we have:
//
list_pairing([]) = ([], NONE)
list_pairing([1]) = ([], SOME(1))
list_pairing([1,2]) = ([(1,2)], NONE)
list_pairing([1,2,3]) = ([(1,3)], SOME(2))
list_pairing([1,2,3,4]) = ([(1,4),(2,3)], NONE)
//
*)
(* ****** ****** *)

(* ****** ****** *)

fun take (n: int) (xs: 'a list): 'a list =
  if n <= 0 then []
  else
  case xs of
         [] => []
       | x :: xs' => x :: take (n-1) xs'

fun nth (xs: 'a list) (n: int): 'a =
  if n < 0 then raise Subscript
  else
  case xs of
         [] => raise Subscript
       | x :: xs' => if n = 0 then x else nth xs' (n-1)

fun
list_pairing
(xs: 'a list): ('a * 'a) list * 'a option =
  let
    val mid = if length xs mod 2 = 0 then NONE else SOME (nth xs (length xs div 2))
    val pairs = list_zip2 (take (length xs div 2) xs, take (length xs div 2) (rev xs))
  in
    (pairs, mid)
  end

(* end of [CS320-2023-Spring-midterm1-list_pairing.sml] *)
