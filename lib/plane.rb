class Plane

	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def disembark!
		@flying = false
	end

	def depart!
		@flying = true
	end
end
