module Command
  class Parser
    def self.parse(instruction)
      args = instruction.split /\s/
      command = args.shift
      command = command.downcase if command
      [command, args]
    end
  end
end