require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:airport) { Airport.new  }
  let(:plane  ) { Plane.new    }
  
  context 'initialize:' do
    it 'should be empty when created' do
      expect(airport.full?).to be false
    end
  end

  context 'taking off and landing:' do
    it 'a plane can land' do  
      expect(airport.full?).to be false
      airport.land(plane)
      expect(airport.plane_count).to eq(1)
    end
    
    it 'a plane can take off' do
      airport.land(plane)
      expect(airport.plane_count).to eq(1)
      airport.take_off(plane)
      expect(airport.plane_count).to eq(0)
    end
  end
  
  context 'traffic control:' do
    it 'a plane cannot land if the airport is full' do
      6.times { airport.land(plane) }
      expect(airport.full?).to be true
      expect { airport.land(plane) }.to raise_error("Airport full!")
    end
  end

context 'weather conditions:' do

      it 'planes cannot take off when there is a storm brewing' do
          allow { airport.take_off(plane) }


      end
      
      it 'a plane cannot land in the middle of a storm' do
      end
    end
end
 
# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"

 
# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!
describe "The grand finale (last spec)" do
  it 'all planes can land and all planes can take off' do
  end
end