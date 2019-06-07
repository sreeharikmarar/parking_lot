RSpec.describe Command::Park do
  let(:parking_lot) { ParkingLot::ParkingLotMain.new }
  let(:command) { Command::Park.new }

  context "#initialize" do
    it "should initialize park command with name" do
      expect(command.name).to eq("park")
    end
  end

  context "#execute" do
    it "should execute park command" do
      parking_lot.create_slots(3)
      response = command.execute(parking_lot, "KA-01-HH-1234", "White")
      expect(response).to eq("Allocated slot number: 1")
    end
  end

  context "#parse" do
    it "should raise an error if arguments are not passed" do
      expect{ command.execute(parking_lot)}.to raise_error(Error::InvalidArgument, "Reg number should not be blank")
    end

    it "should raise an error if color is not passed an argument" do
      expect{ command.execute(parking_lot, "KA-01-HH-1234")}.to raise_error(Error::InvalidArgument, "Color should not be blank")
    end

    it "should raise an error if reg number is not passed an argument" do
      expect{ command.execute(parking_lot, nil , "KA-01-HH-1234")}.to raise_error(Error::InvalidArgument, "Reg number should not be blank")
    end
  end
end
