require_relative 'parking_lot'

parking_lot = ParkingLot::ParkingLotMain.new
manager = Command::Manager.new
reader = Input::Reader.new(ARGV[0])

while(reader.read)
  manager.process(parking_lot, reader.instruction)
end
