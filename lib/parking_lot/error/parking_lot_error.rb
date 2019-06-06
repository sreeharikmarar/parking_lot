module Error
  class ParkingLotError < StandardError; end
  class InvalidArgument < ParkingLotError; end
end
