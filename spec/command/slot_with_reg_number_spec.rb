RSpec.describe Command::SlotWithColor do
  let(:parking_lot) { ParkingLot::ParkingLotMain.new }
  let(:command) { Command::SlotWithRegNumber.new }

 context "#initialize" do
    it "should initialize park command with name" do
      expect(command.name).to eq("slot_number_for_registration_number")
    end
  end

  context "#execute command" do
    it "should execute query command with given argument" do
      parking_lot.create_slots(3)
      parking_lot.park(Vehicle::Car.new("KA-01-HH-1234","Red"))
      parking_lot.park(Vehicle::Car.new("KA-11-HL-412","White"))
      parking_lot.park(Vehicle::Car.new("KA-01-AB-113","White"))

      expect(command.execute(parking_lot, "KA-01-HH-1234")).to eq("1")
    end
  end

  context "#parse" do
    it "should raise an error if arguments are not passed" do
      expect{ command.execute(parking_lot)}.to raise_error(Error::InvalidArgument, "Reg number should not be null")
    end

    it "should raise an error if arguments passed were wrong" do
      expect{ command.execute(parking_lot, "White", "Blue")}.to raise_error(Error::InvalidArgument, "Multiple number of arguments, expected 1")
    end
  end
end
