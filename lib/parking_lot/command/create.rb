module Command
  class Create < Base
    def initialize
      super("create_parking_lot")
    end

    def execute(parking_lot, *args)
      capacity = parse(args)
      parking_lot.create_slots(capacity)
    end

    def parse(args)
      raise Error::InvalidArgument.new("Capacity should not be empty") if args.empty?
      raise Error::InvalidArgument.new("Multiple number of arguments") unless args.length == 1

      Integer(args.first) rescue raise Error::InvalidArgument.new("Capacity should be an Integer")
    end

    def log(capacity)
      puts "Created a parking lot with #{capacity} slots"
    end
  end
end
