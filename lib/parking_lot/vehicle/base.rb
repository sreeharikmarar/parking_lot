module Vehicle
  class Base
    attr_reader :reg_number, :color

    def initialize(reg_number, color)
      @reg_number = reg_number
      @color = color
    end
  end
end
