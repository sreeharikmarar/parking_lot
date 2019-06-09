module Query
  class RegNumberWithColor < Base
    ATTRIBUTE = "color"

    def initialize(value)
      super(ATTRIBUTE, value)
    end

    def execute(parking_lot)
      slots = get_slots_with_given_attribue(parking_lot)
      return "Not found" if slots.empty?

      slots.map { |slot| slot.vehicle.reg_number}.join(", ")
    end
  end
end