module Command
  class RegNumberWithColor < Base
    def initialize
      super("registration_numbers_for_cars_with_colour")
    end

    def execute(parking_lot, *args)
      color = parse(args)
      slots = parking_lot.slots.select { |slot| slot.vehicle.color == color if slot.occupied? }
      slots.map { |slot| slot.vehicle.reg_number}.join(", ")
    end

    def parse(args)
      raise Error::InvalidArgument.new("Color should not be nill") unless args
      raise Error::InvalidArgument.new("Multiple number of arguments, expected 1") unless args.length == 1

      args.first
    end

    def log(msg)
      puts msg
    end
  end
end
