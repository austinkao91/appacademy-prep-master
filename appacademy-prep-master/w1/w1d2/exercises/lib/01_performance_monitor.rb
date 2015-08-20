def measure(num = 1, &block)
	start = Time.now
	(0...num).each do |num|
		yield
	end
	(Time.now - start)/num
end