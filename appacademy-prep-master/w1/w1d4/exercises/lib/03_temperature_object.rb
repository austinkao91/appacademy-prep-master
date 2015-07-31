class Temperature
  # TODO: your code goes here!
	attr_reader :f, :c
	
	def initialize(opts = {})
		if opts.has_key?(:f) 
			@f = opts[:f]
		elsif opts.has_key?(:c) 
			@c = opts[:c]
		else 
			puts "No temperature given"
		end
	end
	
	def in_celsius
		@c = (@f-32)*5.0/9.0 if @c.nil?
		@c
	end
	
	def in_fahrenheit
		@f = (@c*1.8+32) if @f.nil?
		@f
	end
	
	def self.from_celsius(temp)
		Temperature.new(:c => temp)
	end
	
	def self.from_fahrenheit(temp)
		Temperature.new(:f => temp)
	end
end

class Celsius < Temperature
	def initialize(temp)
		@c = temp
		@f = (@c*1.8+32)
	end
end

class Fahrenheit < Temperature
	def initialize(temp)
		@f = temp
		@c = ((@f-32)*5.0/9.0)
	end
end