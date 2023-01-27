fun isp(x: int):

    bool =
    
    let fun find(y: int):
    
    	bool = if y>=x then true
	
	else if x mod y = 0 then false
	
	else find(y+1)
	
	in
	
	find(2)
	
	end

fun isPrime(n0: int):

    bool = if n0<=2 then true else isp(n0)