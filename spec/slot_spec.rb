RSpec.describe ParkingLot::Slot do
  context "#initialize" do
    it "should initialize slot with floor and  number"  do
      slot = ParkingLot::Slot.new(1,2)
      expect(slot.floor).to be 1
      expect(slot.number).to be 2
    end
  end
end
