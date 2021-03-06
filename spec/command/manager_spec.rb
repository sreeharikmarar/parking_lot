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

  before :each do
    parking_lot.create_slots(3)
  end

  context "#process park command" do
    it "should process park command" do
      expect do
        manager.process(parking_lot, "park KA-01-HH-1234 White")
      end.to output("Allocated slot number: 1\n").to_stdout
    end
  end

  context "#process leave command" do
    it "should process leave command" do
      parking_lot.park(Vehicle::Car.new("KA-01-HH-1234","white"))
      expect do
        manager.process(parking_lot, "leave 1")
      end.to output("Slot number 1 is free\n").to_stdout
    end
  end

  context "#process status command" do
    it "should process status command" do
      parking_lot.park(Vehicle::Car.new("KA-01-HH-1234","white"))
      parking_lot.park(Vehicle::Car.new("KA-01-HH-3457","Red"))
      parking_lot.park(Vehicle::Car.new("KA-01-HH-5678","Red"))
      expect do
        manager.process(parking_lot, "status")
      end.to output("Slot No.    Registration No    Colour\n1           KA-01-HH-1234      white\n2           KA-01-HH-3457      Red\n3           KA-01-HH-5678      Red\n").to_stdout
    end
  end

  context "#process registration_numbers_for_cars_with_colour command" do
    it "should process query command" do
      parking_lot.park(Vehicle::Car.new("KA-01-HH-1234","white"))
      parking_lot.park(Vehicle::Car.new("KA-01-HH-3457","Red"))
      parking_lot.park(Vehicle::Car.new("KA-01-HH-5678","Red"))
      expect do
        manager.process(parking_lot, "registration_numbers_for_cars_with_colour Red")
      end.to output("KA-01-HH-3457, KA-01-HH-5678\n").to_stdout
    end
  end

  context "#process slot_numbers_for_cars_with_colour command" do
    it "should process query command" do
      parking_lot.park(Vehicle::Car.new("KA-01-HH-1234","white"))
      parking_lot.park(Vehicle::Car.new("KA-01-HH-3457","Red"))
      parking_lot.park(Vehicle::Car.new("KA-01-HH-5678","Red"))
      expect do
        manager.process(parking_lot, "slot_numbers_for_cars_with_colour Red")
      end.to output("2, 3\n").to_stdout
    end
  end

  context "#process slot_number_for_registration_number command" do
    it "should process status command" do
      parking_lot.park(Vehicle::Car.new("KA-01-HH-1234","white"))
      parking_lot.park(Vehicle::Car.new("KA-01-HH-3457","Red"))
      parking_lot.park(Vehicle::Car.new("KA-01-HH-5678","Red"))

      expect do
        manager.process(parking_lot, "slot_number_for_registration_number KA-01-HH-5678")
      end.to output("3\n").to_stdout
    end

    it "return not found if no result found" do
      parking_lot.park(Vehicle::Car.new("KA-01-HH-1234","white"))
      parking_lot.park(Vehicle::Car.new("KA-01-HH-3457","Red"))
      parking_lot.park(Vehicle::Car.new("KA-01-HH-5678","Red"))
      expect do
        manager.process(parking_lot, "slot_number_for_registration_number MH-04-AY-1111")
      end.to output("Not found\n").to_stdout
    end
  end
end
