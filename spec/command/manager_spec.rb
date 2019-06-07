RSpec.describe Command::Manager do
  let(:parking_lot) { ParkingLot::ParkingLotMain.new }
  let(:manager) { Command::Manager.new }

  context "#initialize" do
    it "should initialize manager with all supported commands" do
      expect(manager.commands.keys.include?("create_parking_lot")).to be_truthy
    end
  end

  context "#process create_parking_lot" do
    it "should process create_parking_lot command with given capacity as argument" do
      expect do
        manager.process(parking_lot, "create_parking_lot 6")
      end.to output("Created a parking lot with 6 slots\n").to_stdout
    end

    it "should return error if the command is not supported" do
      expect { manager.process(parking_lot, "some_command 1") }.to raise_error(Error::InvalidCommand)
    end
  end
end