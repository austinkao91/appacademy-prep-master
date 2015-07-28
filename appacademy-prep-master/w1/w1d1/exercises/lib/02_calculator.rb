def add(a,b)
	a+b
end

def subtract(a,b)
	a-b
end

def sum(arr)
	if arr.length == 0
		return 0
	end
	arr.reduce(:+)
end