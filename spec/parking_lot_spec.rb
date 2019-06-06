RSpec.describe ParkingLot::Base do
  let(:parking_lot) { ParkingLot::Base.new }

  context "#initialize" do
    it "should initialize parking lot" do
      expect(parking_lot.floors).to be(1)
      expect(parking_lot.slots.length).to be(0)
    end
  end

  context "#create_slots" do
    it "should create parking lot with given capacity" do
      expect(parking_lot.create_slots(3)).to be(3)
    end

    it "should raise error if capacity is invalid" do
      expect { parking_lot.create_slots(0) }.to raise_error(Error::InvalidArgument, "Capacity should be atleast one")
    end
  end

  context "#park" do
    before :each do
      parking_lot.create_slots(2)
    end

    it "should park a vehicle on first available slot" do
      expect( parking_lot.park(Vehicle::Car.new("KA-01-HH-1234","Red"))).to eq(1)
    end

    it "should check if parking lot is full" do
      parking_lot.park(Vehicle::Car.new("KA-01-HH-1235","Green"))
      parking_lot.park(Vehicle::Car.new("KA-01-HH-1236","White"))

      expect { parking_lot.park(Vehicle::Car.new("KA-02-HH-1234","Red")) }.to raise_exception(Error::ParkingLotFull, "Sorry, parking lot is full")
    end
  end
end
