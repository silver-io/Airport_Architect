require 'weather'

class Plane

	attr_reader :status

	def initialize
		take_off!
	end

	def take_off!
		@status = :flying
		self
	end

	def disembark!
		@status = :disembarked
		self
	end

end
