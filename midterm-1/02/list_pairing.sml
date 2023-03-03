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
(*
fun
list_pairing
(xs: 'a list): ('a * 'a) list * 'a option = ...
*)
(* ****** ****** *)

  
fun pukro (r: int) (xs: 'a list): 'a list =

    if r <= 0 then []

    else case xs of

        [] => []

       | 

       x :: xs' => x :: pukro (r-1) xs'

fun dosti (xs: 'a list) (k: int): 'a =

    if k < 0 then raise ConsMatch320

    else case xs of

            [] => raise ConsMatch320

            |

             x :: xs' => if k = 0 then x else dosti xs' (k-1)

fun list_pairing (xs: 'a list): ('a * 'a) list * 'a option =

    let

        val amba = length xs

        val darmiyan = if amba mod 2 = 0 then NONE else SOME (dosti xs (amba div 2))

        val jor = list_zip2 (pukro (amba div 2) xs, pukro (amba div 2) (rev xs))

    in

        (jor, darmiyan)

    end
(* end of [CS320-2023-Spring-midterm1-list_pairing.sml] *)
