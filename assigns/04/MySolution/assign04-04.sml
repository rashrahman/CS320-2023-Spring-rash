(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-16: 30 points
//
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
//
Please give a NON-RECURSIVE implementation that solves the 8-queen puzzle.
//
*)

type board_t = int * int * int * int * int * int * int * int

val board_foreach = fn (bd: board_t, work: int -> unit) =>
    let val (x0,x1,x2,x3,x4,x5,x6,x7) = bd
    in
	work(x0); work(x1); work(x2); work(x3); work(x4); work(x5); work(x6); work(x7); ()
    end

val board_get = fn(bd: board_t, i:int) =>
foreach_to_get_at(board_foreach)(bd,i)

val board = fn(bd:board_t, i0:int, j0:int) =>
    let val (x1,x2,x3,x4,x5,x6,x7,x8) = bd
    in
	case i0 of
	     0 => (j0,x2,x3,x4,x5,x6,x7,x8)
	     |1=> (x1,j0,x3,x4,x5,x6,x7,x8)
	     |2=> (x1,x2,j0,x4,x5,x6,x7,x8)
	     |3=> (x1,x2,x3,j0,x5,x6,x7,x8)
	     |4=> (x1,x2,x3,x4,j0,x6,x7,x8)
	     |5=> (x1,x2,x3,x4,x5,j0,x7,x8)
	     |6=> (x1,x2,x3,x4,x5,x6,j0,x8)
	     |7=> (x1,x2,x3,x4,x5,x6,x7,j0)
	     |_=> bd
    end

val safety1 = fn(i0:int, j0:int, i:int, j:int) =>
    (j0<>j) andalso abs_int(i0-i) <> abs_int(j0-j)

val safety2 = fn(i0:int, j0:int, bd: board_t, i:int) =>
    if i>= 0
    then int1_forall(i, fn(x) => safety1(i0,j0,x, board_get(bd,x)))
    else true

val rc = fn(bd:board_t, i0:int) =>
    foreach_to_filter_list(int1_foreach)(8,fn(x) => safety2(i0,x,bd,i0))

val newB = fn(listBoard: board_t list, i0:int) =>
    list_foldleft(listBoard, [], fn(row,bd) =>
        let val avail = rc(bd,i0)
	in
	   case avail of
	   [] => row
	   |_ => row @list_map(avail,fn(x)=> board(bd, i0,x))
	end)

fun queen8_puzzle_solve(): board_t list =
    let
    val start =[(0,0,0,0,0,0,0,0)]
    val listBoard = int1_foldleft(8,start,fn(row,i0) => newB(row,i0))
    val inc = fn(bd: board_t)=>
    	let val(a,b,c,d,e,f,g,h) = bd
	in
	(a+1,b+1,c+1,d+1,e+1,f+1,g+1,h+1)
	end
    val listBoardUpdated = list_map(listBoard,inc)

    in
	listBoardUpdated
    end
(* end of [CS320-2023-Spring-assign04-04.sml] *)
