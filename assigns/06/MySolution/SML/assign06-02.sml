(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
Please enumerate all the pairs of natural
numbers. Given pairs (i1, j1) and (i2, j2),
(i1, j1) should be enumerated ahead of (i2, j2)
if i1+j1 < i2+j2.
*)

(* ****** ****** *)

val theNatPairs: (int*int) stream = fn() =>

    let

        fun assist(n : int): (int*int) stream = stream_tabulate(n + 1, fn(x) => (x, n-x))

        in

            stream_concat(stream_tabulate(~1, fn(i) => assist(i)))()

        end


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-02.sml] *)
