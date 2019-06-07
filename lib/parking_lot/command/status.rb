module Command
  class Status < Base
    def initialize
      super("status")
    end

    def execute(parking_lot, *args)
      parse(args)
      parking_lot.slots.select {|slot| slot.occupied? }
    end

    def parse(args)
      raise Error::InvalidArgument.new("Invalid Argument, expected 0") if args.length > 0
    end

    def log(slots)
      msg = "Slot No.    Registration No    Colour\n"
      slots.each do |slot|
        msg << "#{slot.number}           #{slot.vehicle.reg_number}      #{slot.vehicle.color}\n" if slot.vehicle
      end
      puts msg
    end
  end
end
