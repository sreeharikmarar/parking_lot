require_relative 'parking_lot'

parkingLot = ParkingLot::ParkingLotMain.new
manager = Command::Manager.new
while true
  args = gets.chomp
  manager.process(parkingLot, args)
end
