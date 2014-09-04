require 'airport'
require 'plane'

describe "the grand finale" do
		let(:heathrow) {Airport.new}

    it 'all planes must be able to land' do
	    six_planes = []
	    6.times{ six_planes << Plane.new }
			heathrow.land_all(six_planes)
			six_planes.each do |flying_plane|
				expect(flying_plane.status).to eq :disembarked
			end
			expect(heathrow.plane_count).to eq 6
   	end

    it 'all planes must be able to take_off' do
    	six_planes = []
	    6.times{ six_planes << Plane.new }
	    allow(heathrow).to receive(:stormy?).and_return(false)
	    six_planes.each {|plane| heathrow.land(plane)}
	    six_planes.each {|plane| heathrow.take_off(plane)}
    end

end