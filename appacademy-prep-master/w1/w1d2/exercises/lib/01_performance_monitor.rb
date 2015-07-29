def measure(num = 1, &block)
	res = []
	start = Time.now
	for i in 0...num
		yield
	end
	(Time.now - start)/num
end