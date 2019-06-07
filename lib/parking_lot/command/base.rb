module Command
  class Base
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def execute(obj, args)
      raise NotImplementedError
    end

    def parse(arg)
      raise NotImplementedError
    end
  end
end
