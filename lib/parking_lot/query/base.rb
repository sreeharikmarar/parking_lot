module Query
  class Base
    attr_reader :attribute, :value

    def initialize(attribute, value)
      @attribute = attribute
      @value = value
    end

    def execute
      raise NotImplementedError
    end

    def get_slots_with_given_attribue(parking_lot)
      parking_lot.slots.select { |slot| slot.vehicle.send(@attribute.to_sym) == @value if slot.occupied? }
    end
  end
end