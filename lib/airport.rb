require './lib/weather'
require './lib/plane'

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
	  	raise "Unable to land due to bad weather!" if stormy? == true
	  	plane.disembark!
	  	@planes << plane 
	  end

	  def land_all(planes)
	  	until planes.empty?
	  		begin
	  			plane = planes.pop
		  		land(plane)
		  	rescue RuntimeError => e
		  		@planes << plane
		  	end
	  	end
	  end

	  def take_off(plane)
	  	@planes.delete(plane) unless stormy?
	  	plane.take_off!
	  	raise "Unable to take off due to bad weather!" if stormy? == true
	  end
end
