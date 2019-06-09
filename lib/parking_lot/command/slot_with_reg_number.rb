module Command
  class SlotWithRegNumber < Base
    def initialize
      super("slot_number_for_registration_number")
    end

    def execute(parking_lot, *args)
      reg_number = parse(args)
      query = Query::SlotWithRegNumber.new(reg_number)
      query.execute(parking_lot)
    end

    def parse(args)
      raise Error::InvalidArgument.new("Reg number should not be null") if args.empty?
      raise Error::InvalidArgument.new("Multiple number of arguments, expected 1") if args.length > 1

      args.first
    end

    def log(msg)
      puts msg
    end
  end
end