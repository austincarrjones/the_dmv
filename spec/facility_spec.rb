require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Facility do

  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  #NOTE: A facility must offer a service in order to perform it. 
  #Just because the DMV allows facilities to perform certain services, does not mean that every facility provides every service.
  
  describe '#register a vehicle' do
    it 'can add Vehicle Registration' do
     @facility_1.add_service('Vehicle Registration')
     expect(@facility.services).to eq(["Vehicle Registration"])
     expect(@cruz.registration_date).to eq(nil)
     expect(@facility_1.registered_vehicles).to eq([])
     expect(@facility_1.collected_fees).to eq(0)
    end 

    it 'can register a vehicle' do
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq Date
      expect(@cruz.plate_type).to eq[:regular] #look up if this should be parentheses
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'can collect fees' do
      #if
        #antique $25 fee
        #EV $200 fee
        #everything else $100 fee

    #it can record a plate_type et to :regular, :antique, or :ev upon successful registration
      #if __ 

  #decribe Administer a written test
    #it can administer to only some
      #permit true
      #age >= 16 

  #describe Administer a road test
    #it can administer to only some
      #passed written test

    #it can give license if road test passed

  #describe renew licence
    #it can renew license
      #if road test == pass && earn license


end
