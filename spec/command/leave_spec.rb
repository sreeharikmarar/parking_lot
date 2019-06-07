RSpec.describe Command::Leave do
  let(:parking_lot) { ParkingLot::ParkingLotMain.new }
  let(:command) { Command::Leave.new }

  context "#initialize" do
    it "should initialize leave command with name" do
      expect(command.name).to eq("leave")
    end
  end

  before :each do 
    parking_lot.create_slots(3)
    parking_lot.park(Vehicle::Car.new("KA-01-HH-1234","Red"))
  end

  context "#execute" do
    it "should execute leave command" do
      response = command.execute(parking_lot, "1")
       expect(response).to eq(1)
    end
  end

  context "#parse" do
    it "should raise an error if arguments are not passed" do
      expect{ command.execute(parking_lot)}.to raise_error(Error::InvalidArgument, "Slot number should not be blank")
    end

    it "should raise an error if slot number is not valid" do
      expect{ command.execute(parking_lot, "a")}.to raise_error(Error::InvalidArgument, "Slot number should be integer")
    end

    it "should raise an error if slot number not found" do
      expect{ command.execute(parking_lot, "5")}.to raise_error(Error::InvalidSlotNumber, "Slot number is invalid")
    end
  end
end
