# ParkingLot
  
## Setup

First, install [Ruby](https://www.ruby-lang.org/en/documentation/installation/). Then run the following commands under the `bin` dir.

`bin/setup` will install bundler gem if it is not present and will also install all the other depended gems. 
Once the setup is finished it will also execute all the `spec` (unit test cases ) written under `spec` directory.

```
parking_lot $ bin/setup 
Installing bundler
Installing ruby gems
...
...
ParkingLot::Slot
  #initialize
    should initialize slot with floor and  number

Finished in 0.01805 seconds (files took 0.11175 seconds to load)
61 examples, 0 failures
```

You can run all the `spec` unit tests files separate, by doing

```
parking_lot $ rspec
Command::Create
  #initialize
    should initialize create command with name
..
..
Finished in 0.03341 seconds (files took 0.17896 seconds to load)
61 examples, 0 failures    
``` 

## Functional Tests

You can run functional test spec by doing

```
parking_lot $ bin/run_functional_tests
cd /Users/sreehari/Projects/Personal/GOJEK/parking_lot/bin/../functional_spec; bundle install; bundle exec rake spec:functional
Using rake 10.5.0
..
..
slot_number_for_registration_number KA-01-HH-3141
slot_number_for_registration_number MH-04-AY-1111
.......

Finished in 12.28 seconds (files took 0.10109 seconds to load)
8 examples, 0 failures
```

## USAGE

Once you finish with the setup. You can launch the parking lot application using the steps mentioned below.
You can start the application in File mode as well as in Interactive mode.

## File Mode

You can start the parking lot application in file mode using the command below. Application will execute all the commands and will print the corresponding response in stdout.

```
parking_lot $ bin/parking_lot file_inputs.txt
Created a parking lot with 6 slots
Allocated slot number: 1
Allocated slot number: 2
..
..
```

## Interactive Mode

If you dont provide a file containing all the valid commands as the first argument, by default Parking lot application will start in interactive mode. 

```
parking_lot $ bin/parking_lot 
create_parking_lot 6
Created a parking lot with 6 slots
park KA-01-HH-1234 White
Allocated slot number: 1
..
..
```

## DIR Structure

`main.rb` file under `lib` is the entry point. `application.rb` under `lib/parking_lot` file will initialize ParkingLot application.

```
.
├── Gemfile
├── Gemfile.lock
├── ParkingLot-1.4.2.pdf
├── README.md
├── bin
│   ├── parking_lot
│   ├── run_functional_tests
│   └── setup
├── file_inputs.txt
├── functional_spec
│   ├── Gemfile
│   ├── Gemfile.lock
│   ├── README.md
│   ├── Rakefile
│   ├── fixtures
│   │   └── file_input.txt
│   └── spec
│       ├── end_to_end_spec.rb
│       ├── parking_lot_spec.rb
│       └── spec_helper.rb
├── lib
│   ├── main.rb
│   ├── parking_lot
│   │   ├── application.rb
│   │   ├── command
│   │   │   ├── base.rb
│   │   │   ├── create.rb
│   │   │   ├── leave.rb
│   │   │   ├── manager.rb
│   │   │   ├── park.rb
│   │   │   ├── parser.rb
│   │   │   ├── reg_number_with_color.rb
│   │   │   ├── slot_with_color.rb
│   │   │   ├── slot_with_reg_number.rb
│   │   │   └── status.rb
│   │   ├── command.rb
│   │   ├── error
│   │   │   └── parking_lot_error.rb
│   │   ├── input
│   │   │   ├── base.rb
│   │   │   ├── file_input.rb
│   │   │   ├── reader.rb
│   │   │   └── shell_input.rb
│   │   ├── input.rb
│   │   ├── parking_lot_main.rb
│   │   ├── query
│   │   │   ├── base.rb
│   │   │   ├── reg_number_with_color.rb
│   │   │   ├── slot_with_color.rb
│   │   │   └── slot_with_reg_number.rb
│   │   ├── query.rb
│   │   ├── slot.rb
│   │   ├── ticket.rb
│   │   ├── vehicle
│   │   │   ├── base.rb
│   │   │   └── car.rb
│   │   └── vehicle.rb
│   └── parking_lot.rb
└── spec
    ├── command
    │   ├── create_spec.rb
    │   ├── leave_spec.rb
    │   ├── manager_spec.rb
    │   ├── park_spec.rb
    │   ├── reg_number_with_color_spec.rb
    │   ├── slot_with_color_spec.rb
    │   ├── slot_with_reg_number_spec.rb
    │   └── status_spec.rb
    ├── fixtures
    │   ├── file_input.txt
    │   └── file_input_2.txt
    ├── input
    │   └── reader_spec.rb
    ├── parking_lot_spec.rb
    ├── query
    │   ├── reg_number_with_color_spec.rb
    │   └── slot_with_color_spec.rb
    ├── slot_spec.rb
    ├── spec_helper.rb
    └── vehicle_spec.rb

16 directories, 64 files
```
