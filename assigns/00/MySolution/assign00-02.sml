fun isPrime(n0: int): bool=
    let fun checkIfPrime(x: int)=
    if n0 mod x = 0
    then false
    else if x*x >= n0
    then true
    else checkIfPrime(x+1)

    in
	checkIfPrime(2)
    end	