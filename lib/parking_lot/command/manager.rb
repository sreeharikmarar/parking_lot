module Command
  class Manager
    attr_reader :commands

    def initialize
      @commands = Hash.new
      register_commands
    end

    def process(parking_lot, instruction)
      cmd, args = Parser.parse(instruction)
      command = commands[cmd]
      raise Error::InvalidCommand.new("Command Not Found!") unless command

      puts command.execute(parking_lot, *args)
    end

    def register(command)
      @commands[command.name] = command
    end

    private

    def register_commands
      register(Create.new)
    end
  end
end
