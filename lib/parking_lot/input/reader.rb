module Input
  class Reader
    attr_reader :reader

    def initialize(arg)
      @reader = initialize_reader(arg)
    end

    def instruction
      @reader.instruction
    end

    def read
      @reader.read
    end

    private

    def initialize_reader(arg)
      if arg != nil
        FileInput.new(arg)
      else
        ShellInput.new
      end
    end
  end
end
