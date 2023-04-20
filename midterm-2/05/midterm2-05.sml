(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
A sequence xs of integers captures '231'
if there are three integers a, b, and c
appearing as a subsequence of xs satisfying
c < a < b. Note that a, b, and c do not have
to appear consecutively in xs.

For instance, [1,3,4,2] does capture '231'
For instance, [1,2,4,3] does not capture '231'
For instance, [1,2,3,4] does not capture '231'
*)

(* ****** ****** *)


fun perm_capture_231(xs: int list): bool = 

    let 

        fun lamba(a, xs): bool = 

            if list_forall(xs, fn(b) => b > a) then false else true
        

        fun chotu(b, xs): bool = 

              if list_forall(xs, fn(c) => c > b) then false else true
        
    in 

        case xs of nil => false 

        | x1::xs => 

            case xs of nil => false 

            | x2 :: xs => if lamba(x1, x2::xs) andalso chotu(x1, xs) then true else perm_capture_231(x2::xs)
        
    end


(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-05.sml] *)
