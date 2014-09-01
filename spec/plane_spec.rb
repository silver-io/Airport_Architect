describe Plane do
 
  let(:plane) { Plane.new }
  
  context 'initialize:' do
  	it 'has a flying status when created' do
  		expect(plane.flying?).to be true
		end
	end

	context 'take off and landing' do
		it 'is able to disembark' do
			plane.disembark!
			expect(plane.flying?).to be false
		end
	  
	  it 'can depart' do
	  	plane.depart!
	  	expect(plane.flying?).to be true
	  end
	end
end