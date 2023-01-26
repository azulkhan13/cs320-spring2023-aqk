use "./../assign00-lib.sml";

fun int2str(i0: int):

    string = if i0<10 then String.str(Char.chr(i0+48))
    
    else (int2str(i0 div 10)) ^ (String.str (Char.chr((i0 mod 10)+48)))
    