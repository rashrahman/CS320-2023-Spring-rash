use "./../assign00-lib.sml"; 
fun int2char(n: int): char =
    Char.chr(n+48)
fun int2str(i0: int): string =
    if i0 < 10
    then String.str(int2char(i0))
    else int2str(i0 div 10)^String.str(int2char(i0 mod 10))


