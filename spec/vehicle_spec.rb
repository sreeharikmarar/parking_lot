RSpec.describe Vehicle::Car  do
  context "#initialize" do
    it "should initialize car with reg_number and color" do
      car = Vehicle::Car.new("KA-01-HH-1234","White")
      expect(car.reg_number).to eq("KA-01-HH-1234")
      expect(car.color).to eq("White")
    end
  end
end
