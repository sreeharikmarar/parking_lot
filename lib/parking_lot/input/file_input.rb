module Input
  class FileInput < Base
    attr_accessor :file

    def initialize(arg)
      raise Error::FileNotFound.new("No such file") unless File.exist?(arg)
      @file = File.new(arg)
    end

    def instruction
      @file.gets
    end

    def read
      !@file.eof?
    end
  end
end
