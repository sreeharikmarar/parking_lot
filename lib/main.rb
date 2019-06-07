require_relative 'parking_lot'

parking_lot = ParkingLot::ParkingLotMain.new
manager = Command::Manager.new
reader = Input::Reader.new(ARGV[0])

while(reader.read)
  begin
    manager.process(parking_lot, reader.instruction)
  rescue Error::ParkingLotError => e
    puts e.message
  end
end