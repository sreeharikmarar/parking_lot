RSpec.describe Command::Create do
  let(:parking_lot) { ParkingLot::ParkingLotMain.new }
  let(:command) { Command::Create.new }

  context "#initialize" do
    it "should initialize create command with name" do
      expect(command.name).to eq("create_parking_lot")
    end
  end

  context "#execute" do
    it "should execute create command" do
      response = command.execute(parking_lot, "6")
      expect(response).to eq(6)
    end
  end

  context "#parse" do
    it "should raise an error if the argument is not valid" do
      expect{ command.execute(parking_lot, "0")}.to raise_error(Error::InvalidArgument, "Capacity should be atleast one")
    end

    it "should raise an error if the argument is not an integer value" do
      expect{ command.execute(parking_lot, "a")}.to raise_error(Error::InvalidArgument, "Capacity should be an Integer")
    end

    it "should raise an error if the capacity is not passed as an argument" do
      expect{ command.execute(parking_lot)}.to raise_error(Error::InvalidArgument, "Capacity should not be empty")
    end
  end
end
