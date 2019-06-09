module Query
  class SlotWithRegNumber < Base
    ATTRIBUTE = "reg_number"

    def initialize(value)
      super(ATTRIBUTE, value)
    end

    def execute(parking_lot)
      slots = get_slots_with_given_attribue(parking_lot)
      return "Not found" if slots.empty?

      slots.map { |slot| slot.number}.join(", ")
    end
  end
end