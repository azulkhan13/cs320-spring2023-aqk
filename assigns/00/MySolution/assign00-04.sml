use "./../assign00-lib.sml";

fun xpo(j: int, k: int, m:int):

    int = if m = 1 then j else if m = 0 then 1

    else xpo (j*k, k, m-1)

fun flipd(cs: string,q:int):

    int = if String.size(cs)-1 = q then (Char.ord(String.sub(cs , q)) - 48)
    
    else flipd(cs , q+1) + ((Char.ord(String.sub(cs , q)) - 48) * xpo(10 , 10, String.size(cs) - q -1))


fun str2int(cs:string):

    int = flipd(cs,0)
    