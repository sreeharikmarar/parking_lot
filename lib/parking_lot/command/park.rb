module Command
  class Park < Base
    def initialize
      super("park")
    end

    def execute(parking_lot, *args)
      reg_number, color = parse(args)
      slot_number = parking_lot.park(Vehicle::Car.new(reg_number,color))
      "Allocated slot number: #{slot_number}"
    end

    def parse(args)
      reg_number, color = args
      raise Error::InvalidArgument.new("Reg number should not be blank") unless reg_number
      raise Error::InvalidArgument.new("Color should not be blank") unless color

      [reg_number, color]
    end
  end
end