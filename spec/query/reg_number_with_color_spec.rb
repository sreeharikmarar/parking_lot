RSpec.describe Query::RegNumberWithColor do
  let(:parking_lot) { ParkingLot::ParkingLotMain.new }
  let (:query) { Query::RegNumberWithColor.new("White") }

  context "#initialize" do
    it "should initialize query" do
      expect(query.attribute).to eq("color")
      expect(query.value).to eq("White")
    end
  end

  context "#execute query" do
    it "should execute query with given argument" do
      parking_lot.create_slots(3)
      parking_lot.park(Vehicle::Car.new("KA-01-HH-1234","Red"))
      parking_lot.park(Vehicle::Car.new("KA-11-HL-412","White"))
      parking_lot.park(Vehicle::Car.new("KA-01-AB-113","White"))

      expect(query.execute(parking_lot)).to eq("KA-11-HL-412, KA-01-AB-113")
    end

    it "should return not found if the results are empty" do
      parking_lot.create_slots(3)
      query = Query::RegNumberWithColor.new("Green")
      parking_lot.park(Vehicle::Car.new("KA-01-HH-1234","Red"))
      parking_lot.park(Vehicle::Car.new("KA-11-HL-412","White"))
      parking_lot.park(Vehicle::Car.new("KA-01-AB-113","White"))

      expect(query.execute(parking_lot)).to eq("Not found")
    end
  end
end