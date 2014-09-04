require 'airport'
require 'plane'

describe "the grand finale" do
		let(:heathrow) {Airport.new}

    it 'all planes must be able to land' do
	    six_planes = []
	    6.times{six_planes << Plane.new }
	    allow(heathrow).to receive(:stormy?).and_return(false)
	    six_planes.each {|plane| heathrow.land(plane)}
	   	end

    it 'all planes must be able to take_off' do
    	six_planes = []
	    6.times{six_planes << Plane.new }
	    allow(heathrow).to receive(:stormy?).and_return(false)
	    six_planes.each {|plane| heathrow.take_off(plane)}
	    # allow(heathrow).to receive(:stormy?).and_return(true)
	    # expect{heathrow.land(last_plane)}.to raise_error "Unable to land due to bad weather!"
	    # expect(heathrow.plane_count).to eq(6)


	    # heathrow.release_all_landed_planes
	    # expect(heathrow.plane_count).to eq 0
    end

end