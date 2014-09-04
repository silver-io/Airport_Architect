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
      allow(airport).to receive(:stormy?).and_return false
      expect(airport.full?).to be false
      airport.land(plane)
      expect(airport.plane_count).to eq(1)
    end
    
    it 'a plane can take off' do
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.plane_count).to eq(1)
      airport.take_off(plane)
      expect(airport.plane_count).to eq(0)
    end

    it 'changes status after take off and landing' do
      allow(airport).to receive(:stormy?).and_return false
      allow(plane).to receive(:take_off).and_return(@flying= true)
      allow(plane).to receive(:land).and_return(@flying= false)
      airport.take_off(plane)  
      airport.land(plane)
      expect(@flying).to eq false
    end
  end
  
  context 'traffic control:' do
    
    it 'a plane cannot land if the airport is full' do
      allow(airport).to receive(:stormy?).and_return false
      6.times { airport.land(plane) }
      expect(airport.full?).to be true
      expect { airport.land(plane) }.to raise_error("Airport full!")
    end
  end

  context 'weather conditions:' do

    it 'planes cannot take off when there is a storm brewing' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.take_off(plane) }.to raise_error("Unable to take off due to bad weather!")
    end
      
    it 'a plane cannot land in the middle of a storm' do
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error("Unable to land due to bad weather!")
    end
  end
end
 
