(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
The function list_tabulate takes an integer
[n] and a function [f] and returns a list that
equals [f(0), f(1), ..., f(n-1)]
//

*)

fun list_tabulate(n: int, f: int -> 'a): 'a list =

let
    fun x(n: int, f: int -> 'a, k: 'a list): 'a list =

        if n=0 then k

        else x(n-1, f, f(n-1)::k)

in x(n,f,[])

end





(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-03.sml] *)
