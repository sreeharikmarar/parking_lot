module Command
  class SlotWithColor < Base
    def initialize
      super("slot_numbers_for_cars_with_colour")
    end

    def execute(parking_lot, *args)
      color = parse(args)
      query = Query::SlotWithColor.new(color)
      query.execute(parking_lot)
    end

    def parse(args)
      raise Error::InvalidArgument.new("Color should not be null") if args.empty?
      raise Error::InvalidArgument.new("Multiple number of arguments, expected 1") if args.length > 1

      args.first
    end

    def log(msg)
      puts msg
    end
  end
end