RSpec.describe Command::RegNumberWithColor do
  let(:parking_lot) { ParkingLot::ParkingLotMain.new }
  let(:command) { Command::RegNumberWithColor.new }

 context "#initialize" do
    it "should initialize park command with name" do
      expect(command.name).to eq("registration_numbers_for_cars_with_colour")
    end
  end

  context "#execute command" do
    it "should execute query command with given argument" do
      parking_lot.create_slots(3)
      parking_lot.park(Vehicle::Car.new("KA-01-HH-1234","Red"))
      parking_lot.park(Vehicle::Car.new("KA-11-HL-412","White"))
      parking_lot.park(Vehicle::Car.new("KA-01-AB-113","White"))

      expect(command.execute(parking_lot, "White")).to eq("KA-11-HL-412, KA-01-AB-113")
    end
  end
end
