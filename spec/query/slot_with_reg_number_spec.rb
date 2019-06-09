RSpec.describe Query::SlotWithRegNumber do
  let(:parking_lot) { ParkingLot::ParkingLotMain.new }
  let (:query) { Query::SlotWithRegNumber.new("KA-01-HH-1234") }

  context "#initialize" do
    it "should initialize query" do
      expect(query.attribute).to eq("reg_number")
      expect(query.value).to eq("KA-01-HH-1234")
    end
  end

  context "#execute query" do
    it "should execute query with given argument" do
      parking_lot.create_slots(3)
      parking_lot.park(Vehicle::Car.new("KA-01-HH-1234","Red"))
      parking_lot.park(Vehicle::Car.new("KA-11-HL-412","White"))

      expect(query.execute(parking_lot)).to eq("1")
    end
  end
end