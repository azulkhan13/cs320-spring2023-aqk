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
*)
type board_t = int * int * int * int * int * int * int * int

val board_foreach = fn(bd: board_t, work: int -> unit) =>

    let 

        val (x0, x1, x2, x3, x4, x5, x6, x7) =  bd

    in  

        work(x0); work(x1); work(x2); work(x3); work(x4); work(x5); work(x6); work(x7); ()

    end

val board_get = fn(bd: board_t, i: int) =>

    foreach_to_get_at(board_foreach)(bd, i)

val board = fn(bd: board_t, i0: int, j0: int) =>

    let 

        val (x1, x2, x3, x4, x5, x6, x7, x8) = bd

    in

        case i0 of

        0 => (j0,x2,x3,x4,x5,x6,x7,x8)

        |

        1 => (x1,j0,x3,x4,x5,x6,x7,x8)

        |

        2 => (x1,x2,j0,x4,x5,x6,x7,x8)

        |

        3 => (x1,x2,x3,j0,x5,x6,x7,x8)

        |

        4 => (x1,x2,x3,x4,j0,x6,x7,x8)

        |

        5 => (x1,x2,x3,x4,x5,j0,x7,x8)

        |

        6 => (x1,x2,x3,x4,x5,x6,j0,x8)

        |

        7 => (x1,x2,x3,x4,x5,x6,x7,j0)

        |

        _ => bd

    end

val safety_test1 = fn(i0: int,j0: int, i: int, j: int) =>

    (j0 <> j) andalso abs_int(i0 - i) <> abs_int(j0 - j)

val safety_test2 = fn(i0: int, j0: int, bd: board_t, i: int) =>

    if i>= 0 then int1_forall(i, fn(x) => safety_test1(i0, j0, x, board_get(bd, x)))

    else true

val coro = fn(brd: board_t, i0: int) =>

    foreach_to_filter_list(int1_foreach)(8, fn(z) => safety_test2(i0, z, brd, i0))

val nwbd = fn(bdls: board_t list, i0: int) => list_foldleft(bdls, [], fn(row, bd) =>

    let

        val v = coro(bd, i0)

        in case v of 

            [] => row

            |

            _ => row @ list_map(v, fn(x) => board(bd, i0, x))

        end)

val queen8_puzzle_solve = fn() =>

    let 

        val start= [(0,0,0,0,0,0,0,0)]

        val bdls = int1_foldleft(8, start, fn(row, i0) => nwbd(row, i0))

        val accbd = fn(board1: board_t) =>

            let 

                val(a,b,c,d,w,x,y,z) = board1 in(a+1, b+1, c+1, d+1, w+1, x+1, y+1, z+1)

            end

            val updbd = list_map(bdls, accbd)

            in  

                updbd

            end





