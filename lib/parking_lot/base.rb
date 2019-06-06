module ParkingLot
  class Base
  	NUMBER_OF_FLOORS=1
    attr_reader :floors, :slots

    def initialize(floors=NUMBER_OF_FLOORS)
      @floors = floors
      @slots = Array.new
    end

    def create_slots(capacity)
      raise Error::InvalidArgument.new("Capacity should be atleast one") unless capacity > 0
      1.upto(@floors) do |floor|
        1.upto(capacity) do |slot|
          @slots.push(ParkingLot::Slot.new(floor,slot))
        end
      end

      capacity
    end
  end
end
