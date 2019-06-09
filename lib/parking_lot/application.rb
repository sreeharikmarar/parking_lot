module ParkingLot
  class Application
    class << self
      def initialize!(args)
        begin
          parking_lot  = ParkingLot::ParkingLotMain.new
          reader       = Input::Reader.new(args)
          cmd_manager  = Command::Manager.new

          while(reader.read)
            begin
              cmd_manager.process(parking_lot, reader.instruction)
            rescue Error::ParkingLotError => e
              puts e.message
            end
          end

        rescue SystemExit, Interrupt
          puts "Exited!"
        rescue StandardError => e
          puts "Error: #{e.message}"
        end
      end
    end
  end
end