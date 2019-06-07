module Input
  class ShellInput < Base
    def instruction
      gets.chomp
    end

    def read
      true
    end
  end
end