module Command
  class Leave < Base
    def initialize
      super("leave")
    end

    def execute(parking_lot, *args)
      slot_number = parse(args)
      parking_lot.leave(slot_number)
    end

    def parse(args)
      raise Error::InvalidArgument.new("Slot number should not be blank") if args.empty?
      raise Error::InvalidArgument.new("Multiple number of arguments, expected one") unless args.length == 1

      Integer(args.first) rescue raise Error::InvalidArgument.new("Slot number should be integer")
    end

    def log(number)
      puts "Slot number #{number} is free"
    end
  end
end
