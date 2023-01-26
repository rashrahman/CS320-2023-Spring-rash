use "./../assign00-lib.sml";

fun reverse(cs: string, index: int): string=
if index < 0
then ""
else if index = 0
then String.str(String.sub(cs,0))
else ((String.str(String.sub(cs,index)))^reverse(cs,index-1))

fun stringrev(cs: string): string=
    reverse(cs, (String.size(cs)-1))
    