require 'spec_helper'

RSpec.describe 'Parking Lot' do
  let(:pty) { PTY.spawn('parking_lot') }

  before(:each) do
    run_command(pty, "create_parking_lot 3\n")
  end

  it "can create a parking lot", :sample => true do
    expect(fetch_stdout(pty)).to end_with("Created a parking lot with 3 slots\n")
  end

  it "can park a car" do
    run_command(pty, "park KA-01-HH-3141 Black\n")
    expect(fetch_stdout(pty)).to end_with("Allocated slot number: 1\n")
  end
  
  it "can unpark a car" do
    run_command(pty, "park KA-01-HH-3141 Black\n")
    run_command(pty, "leave 1\n")
    expect(fetch_stdout(pty)).to end_with("Slot number 1 is free\n")
  end
  
  it "can report status" do
    run_command(pty, "park KA-01-HH-1234 White\n")
    run_command(pty, "park KA-01-HH-3141 Black\n")
    run_command(pty, "park KA-01-HH-9999 White\n")
    run_command(pty, "status\n")
    expect(fetch_stdout(pty)).to end_with(<<-EOTXT
Slot No.    Registration No    Colour
1           KA-01-HH-1234      White
2           KA-01-HH-3141      Black
3           KA-01-HH-9999      White
EOTXT
)
  end
  
  it "can get reg numbers of cars with given color" do
    run_command(pty, "park KA-01-HH-1234 White\n")
    run_command(pty, "park KA-01-HH-3141 Black\n")
    run_command(pty, "park KA-01-HH-9999 White\n")
    run_command(pty, "registration_numbers_for_cars_with_colour White\n")
    expect(fetch_stdout(pty)).to end_with("KA-01-HH-1234, KA-01-HH-9999\n")
  end

  it "can get slot numbers of cars with given color" do
    run_command(pty, "park KA-01-HH-1234 White\n")
    run_command(pty, "park KA-01-HH-3141 Black\n")
    run_command(pty, "park KA-01-HH-9999 White\n")
    run_command(pty, "slot_numbers_for_cars_with_colour White\n")
    expect(fetch_stdout(pty)).to end_with("1, 3\n")
  end

  it "can get slot numbers of cars with given register number" do
    run_command(pty, "park KA-01-HH-1234 White\n")
    run_command(pty, "park KA-01-HH-3141 Black\n")
    run_command(pty, "park KA-01-HH-9999 White\n")
    run_command(pty, "slot_number_for_registration_number KA-01-HH-3141\n")
    expect(fetch_stdout(pty)).to end_with("2\n")
  end
  
  context "validations" do
    it "cannot park if parking lot is full" do
      run_command(pty, "park KA-01-HH-1234 White\n")
      run_command(pty, "park KA-01-HH-3141 Black\n")
      run_command(pty, "park KA-01-HH-9999 White\n")
      run_command(pty, "park KA-01-HH-9999 White\n")
      expect(fetch_stdout(pty)).to end_with("Sorry, parking lot is full\n")
    end

    it "cannot leave if ticket is invalid" do
      run_command(pty, "leave 4\n")
      expect(fetch_stdout(pty)).to end_with("Slot number is invalid\n")
    end

    it "cannot execute an invalid command" do
      run_command(pty, "some_command 4\n")
      expect(fetch_stdout(pty)).to end_with("Command Not Found!\n")
    end
  end
end
