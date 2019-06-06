module Error
  class ParkingLotError < StandardError; end
  class InvalidArgument < ParkingLotError; end
  class ParkingLotFull < ParkingLotError; end
end
