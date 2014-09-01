require 'plane'

describe Plane do
 
  	let(:plane)   { Plane.new }
  
		it "has a flying status when created" do
			expect(plane.status).to be :flying
		end

		it "changes its status to flying after taking off" do
			plane.take_off!
			expect(plane.status).to be :flying
		end

		it "changes its status to landed after landing" do
			plane.take_off!.disembark!
			expect(plane.status).to be :disembarked
		end
end