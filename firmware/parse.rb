#!/usr/bin/ruby

class Pair
	attr_accessor :on
	attr_accessor :off
end

def round(number)
	(number + 0.5).to_i
end

Dir.glob("Test1/*.dat") do |file| 

	average_period = 0
	freq = 0
	current_pulse_length = 0
	File.readlines(file).each do |file_line|

		match = file_line.match(/[0-9]+:\s+1\s+([0-9]+)\s+0\s+([0-9]+)/)
		if(!match.nil?)

			time_on, time_off = match.captures.map{ |c| c.to_f }

			if(freq == 0 )
				average_period = time_on + time_off
				freq = round(1000000000/average_period)
			end


			if ( ((time_on + time_off - 100) <= average_period ) && ((time_on + time_off + 100) >= average_period ) )
				current_pulse_length += time_on + time_off
			else
				current_pulse_length += time_on 
				current_pulse_length = round(current_pulse_length/10000)*100
				pair = Pair.new
				pair.on = current_pulse_length

				current_pulse_length = 0
				time_off = round(time_off/10000)*100

				pair.off = time_off
				puts "#{pair.on} : #{pair.off}"
		    end
		end
	end
end
