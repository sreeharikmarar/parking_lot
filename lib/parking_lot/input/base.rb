module Input
  class Base
    def instruction
      raise NotImplementedError
    end

    def read
      raise NotImplementedError
    end
  end
end
