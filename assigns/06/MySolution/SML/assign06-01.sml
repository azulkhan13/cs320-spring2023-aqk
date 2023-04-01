(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
The following is a well-known series:
ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...
Please implement a stream consisting of all the partial
sums of this series.
The 1st item in the stream equals 1
The 2nd item in the stream equals 1 - 1/2
The 3rd item in the stream equals 1 - 1/2 + 1/3
The 4th item in the stream equals 1 - 1/2 + 1/3 - 1/4
And so on, and so forth
//
*)

(* ****** ****** *)

val the_ln2_stream: real stream = fn() =>

    let

        fun assister(n : int, count) = fn () =>

            let

                fun ass2(x) = Real.fromInt(pow_int_int(~1, x - 1)) / Real.fromInt x
            in

            if n <= 0 then strcon_nil

            else strcon_cons(ass2(n) + count, assister(n + 1, ass2(n) + count))

            end

            in

                assister(1,0.0)()

            end


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-01.sml] *)
