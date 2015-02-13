#!/usr/bin/ruby

class PulsePair

	attr_reader :on
	attr_reader :off

	def initialize(on,off)
		@on = on
		@off = off
	end
end

class TelevisionCode
	attr_accessor :carrier_frequency
	
	def initialize
		@pulse_pairs = []
	end

	def add(pulse_pair)
		@pulse_pairs.push(pulse_pair)
	end
end



def round(number)
	(number + 0.5).to_i
end

Dir.glob("**/*.dat") do |file| 

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
				pair = PulsePair.new( round(current_pulse_length/10000)*100 , round(time_off/10000)*100 )

				puts "#{pair.on} : #{pair.off}"
				current_pulse_length = 0
		    end
		end
	end
end
