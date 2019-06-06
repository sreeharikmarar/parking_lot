module ParkingLot
  class Ticket
    attr_reader :slot

    def initialize(slot)
      @slot = slot
    end
  end
end
