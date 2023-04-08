(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-03-31: 20 points
Please implement the following function
that enumerates all the pairs (i, j) of natural
numbers satisfying $i <= j$; a pair (i1, j1) must
be enumerated ahead of another pair (i2, j2) if the
following condition holds:
  i1*i1*i1 + j1*j1*j1 < i2*i2*i2 + j2*j2*j2
//

//
*)

fun cube(n: int) : int = n * n * n

fun gpsAsis(prnm: int, str: int, fp: int -> 'a) : 'a stream =

    let

        fun lp(x: int): 'a stream = fn() => 
          
          strcon_cons(fp(x), lp(x + 1))

        fun begsrt(x: int): 'a stream = fn() =>

            if x >= prnm then strcon_nil

            else

                strcon_cons(fp(x), begsrt(x + 1))

    in

        if prnm < 0 then lp(str)

    else

        begsrt(str)

    end

fun sGp(n : int) : (int * int) stream = 

  gpsAsis(~1, n, fn(i) => (n, i))

val theNatPairs_cubesum: (int * int) stream =

    let

        fun lpr(pn : int) : (int * int) stream = fn() =>

            (strcon_cons((0, pn), stream_merge2(sGp(pn), lpr(pn + 1), fn((i1, j1), (i2, j2)) => cube(i1) + cube(j1) <= cube(i2) + cube(j2))))

    in

        stream_cons((0, 0), lpr(1))

    end

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign07-02.sml] *)
