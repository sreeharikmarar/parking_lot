module ParkingLot
  class Slot
    attr_reader :floor, :number, :occupied

    def initialize(floor, number)
      @floor = floor
      @number = number
      @occupied = false
    end

    def is_free?
      @occupied == false
    end

    def occupied!
      @occupied = true
    end

    def assign(vehicle)
      @vehicle = vehicle
      @number
    end
  end
end
