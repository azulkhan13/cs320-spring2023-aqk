(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-04-07: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

(* ****** ****** *)

fun assis(vas : 'a, xs : 'a list): 'a list stream = fn() =>

    case (vas, xs) of

        (x, []) => strcon_cons([x], stream_nil())

        | 

        (x, (g :: v)) => strcon_cons((x::g::v), stream_make_map(assis(x,v), fn(w) => g :: w))


fun stream_permute_list(xs: 'a list): 'a list stream = 

    case xs of

        [] => stream_cons([], stream_nil())

        |

         x :: xs => stream_concat(stream_make_map(stream_permute_list(xs), fn(w) => assis(x,w)))


(* end of [CS320-2023-Spring-assign08-01.sml] *)
