val ord = Char.ord

val chr = Char.chr

val str = String.str

val strlen =
String.size

val strcat = op^ 

val strsub = String.sub

fun xpo(j: int, k: int, m:int):

    int = if m = 1 then j else if m = 0 then 1

    else xpo (j*k, k, m-1)

fun flipd(cs: string,q:int):

    int = if String.size(cs)-1 = q then (Char.ord(String.sub(cs , q)) - 48)
    
    else flipd(cs , q+1) + ((Char.ord(String.sub(cs , q)) - 48) * xpo(10 , 10, String.size(cs) - q -1))


fun str2int(cs:string):

    int = flipd(cs,0)

fun vld(cs: string, z: int): bool = 

    if ((Char.ord(String.sub(cs,z))-48)) >= 0 andalso ((Char.ord(String.sub(cs , z)) - 48)) <= 9 then true

    else false

fun help(cs: string, z: int): bool = 

    if String.size(cs) = 0 then false

    else if (String.size(cs)-1) = z then vld(cs, z)

    else if vld(cs, z) then help(cs, z + 1)

    else false

fun help2(cs: string): int option = 

    if help(cs, 0) = true then SOME(str2int(cs))

    else NONE;

fun str2int_opt(cs: string): int option =

    help2(cs)
