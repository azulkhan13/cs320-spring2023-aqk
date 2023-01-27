use "./../assign00-lib.sml";

fun revandflip(cs: string, k: int):

    string = if k < 0 then ""
    
    else if k = 0 then String.str(String.sub(cs,0))
    
    else ((String.str(String.sub(cs, k))) ^ revandflip(cs, k-1))

fun stringrev(cs: string):

    string = revandflip(cs, (String.size(cs)-1))