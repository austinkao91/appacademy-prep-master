def reverse(str)
	res = ""
	str.each_char do |char|
		res = char + res
	end
	res
end
def reverser(&block)
	res = []
	yield.split(" ").each do |word|
		res.push(reverse(word))
	end
	res.join(" ")
end	

def adder(num = 1, &block)
	yield + num
end

def repeater(num = 1, &block)
	count = 0
	while (count < num)
		yield
		count += 1
	end
end