fun fact(x: int): int= if x>0 then x *fact(x-1) else 1
fun fact2(x: int): int = fact(x)handle Overflow =>0
fun findOverflow(x:int): int = if fact2(x)<>0 then findOverflow(x+1) else x
val N = findOverflow(0)