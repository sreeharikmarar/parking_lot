module ParkingLot
  class ParkingLotMain
    NUMBER_OF_FLOORS=1
    attr_reader :floors, :slots, :tickets

    def initialize(floors=NUMBER_OF_FLOORS)
      @floors = floors
      @slots = Array.new
      @tickets = Hash.new
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

    def park(vehicle)
      ticket = issue_ticket
      ticket.slot.assign(vehicle)
    end

    def leave(number)
      ticket = get_ticket(number)
      ticket.slot.clear!
    end

    private

    def next_available_slot
      raise Error::ParkingLotFull.new("Slots are not created") if @slots.empty?

      @slots.find(&:is_free?)
    end

    def issue_ticket
      slot = next_available_slot
      raise Error::ParkingLotFull.new("Sorry, parking lot is full") unless slot

      slot.occupied!

      ticket = Ticket.new(slot)
      @tickets[slot.number] = ticket
      ticket
    end

    def get_ticket(number)
      ticket = @tickets[number]
      raise Error::InvalidSlotNumber.new("Slot number is invalid") unless ticket

      ticket
    end
  end
end
