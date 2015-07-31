class Timer
	attr_accessor :seconds
	def initialize
		@seconds = 0
	end
	
	def time_string
		hours = @seconds/3600
		min = (@seconds - hours*3600)/60
		sec = (@seconds-hours*3600-min*60)
		string = "#{num_to_string(hours)}:#{num_to_string(min)}:#{num_to_string(sec)}"
	end
	
	private
	def num_to_string(num)
		string = ""
		if num < 10
			string = "0#{num}"
		else
			string = "#{num}"
		end
		string
	end
end