RSpec.describe Command::Leave do
  let(:parking_lot) { ParkingLot::ParkingLotMain.new }
  let(:command) { Command::Status.new }
  let(:vehicle_1) { Vehicle::Car.new("KA-01-HH-1235","Green")}
  let(:vehicle_2) { Vehicle::Car.new("KA-01-HH-1236","White")}
  let(:vehicle_3) { Vehicle::Car.new("KA-01-HH-1237","Ref")}

  context "#initialize" do
    it "should initialize status command with name" do
      expect(command.name).to eq("status")
    end
  end

  before :each do
    parking_lot.create_slots(3)
    parking_lot.park(vehicle_1)
    parking_lot.park(vehicle_2)
  end

  context "#execute" do
    it "should execute status command" do
      response = command.execute(parking_lot)
      expect(response.find{|v| v.vehicle == vehicle_1 }).to be_truthy
      expect(response.find{|v| v.vehicle == vehicle_2 }).to be_truthy
      expect(response.find{|v| v.vehicle == vehicle_3 }).to be_falsey
    end
  end

  context "#parse" do
    it "should raise an error if any arguments is passed" do
      expect{ command.execute(parking_lot, "0")}.to raise_error(Error::InvalidArgument, "Invalid Argument, expected 0")
    end
  end

  context "#log" do
    it "should log reponse of execute" do
      response = command.execute(parking_lot)
      expect do
        command.log(response)
      end.to output("Slot No.    Registration No    Colour\n1           KA-01-HH-1235      Green\n2           KA-01-HH-1236      White\n").to_stdout
    end
  end
end
