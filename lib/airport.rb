require 'weather'

class Airport
include Weather

DEFAULT_CAPACITY = 6

	def initialize(options = {})    
  @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  @planes = []
	end

	def plane_count
		@planes.count
	end

  def capacity
  	@capacity
  end

  def full?
  	plane_count == @capacity
  end

  def land(plane)
  	raise 'Airport full!' if full?
  	@planes << plane unless stormy?
  end

  def take_off(plane)
  	@planes.delete(plane) unless stormy?
  end


end
