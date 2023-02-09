use "./../assign00-lib.sml";

fun exp(i: int, extra: int, n: int): int=
    if n=1 then i
    else if n=0
    then 1
    else exp((i* extra), extra, n-1)

fun str2intHelper (cs: string, n: int): int=
    if String.size(cs)-1 = n
    then (Char.ord(String.sub(cs,n))-48)
    else (str2intHelper(cs, n+1) + ((Char.ord(String.sub(cs,n))-48) * exp(10,10,String.size(cs)-n-1)))

fun str2int(cs :string): int=
    str2intHelper(cs,0)