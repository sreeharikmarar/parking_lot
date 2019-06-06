module ParkingLot
  class Slot
    attr_reader :floor, :number, :occupied

    def initialize(floor, number)
      @floor = floor
      @number = number
      @occupied = false
    end
  end
end
