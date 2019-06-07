RSpec.describe Input::Reader do
  context "#initialize" do
    it "should initialize file input reader if file name is passed as first argument" do
      input = Input::Reader.new("#{File.join(File.dirname(__FILE__), '..', 'fixtures', 'file_input.txt')}")
      expect(input.reader.class).to be(Input::FileInput)
    end

    it "should initialize shells input reader if argument is not passed" do
      input = Input::Reader.new(nil)
      expect(input.reader.class).to be(Input::ShellInput)
    end

    it "shuld raise an error if file doesnt exist" do
      expect { Input::Reader.new("test") }.to raise_error(Error::FileNotFound, "No such file")
    end
  end

  context "#read" do
    it "should read content till end of file if the input is file" do
      input  = Input::Reader.new("#{File.join(File.dirname(__FILE__), '..', 'fixtures', 'file_input_2.txt')}")

      expect(input.reader.read).to be_truthy
      input.reader.instruction
      expect(input.reader.read).to be_falsey
    end
  end

  context "#instruction read from file mode" do
    it "should read the content from file line by line" do
      input = Input::Reader.new("#{File.join(File.dirname(__FILE__), '..', 'fixtures', 'file_input.txt')}")
      expect(input.reader.instruction).to eq("create_parking_lot 6\n")
      expect(input.reader.instruction).to eq("park KA-01-HH-1234 White\n")
    end
  end

  before do
    $stdin = StringIO.new("create_parking_lot 6")
  end

  after do
    $stdin = STDIN
  end

  context "#instruction read from shell mode" do
    it "should read the content from shell" do
      input = Input::Reader.new(nil)
      expect(input.reader.instruction).to eq("create_parking_lot 6")
    end
  end
end
