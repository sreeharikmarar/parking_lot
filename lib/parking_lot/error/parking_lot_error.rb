module Error
  class ParkingLotError < StandardError; end
  class InvalidArgument < ParkingLotError; end
  class ParkingLotFull < ParkingLotError; end
  class InvalidSlotNumber < ParkingLotError; end
  class InvalidCommand < ParkingLotError; end
  class FileNotFound < ParkingLotError; end
end
