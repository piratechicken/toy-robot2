# frozen_string_literal: true

module ToyRobot
  class FileCommand
    DEFAULT_SIZE = 5

    def initialize(file_name)
      @simulator = Simulator.new
      @commands = parse_commands(file_name)
    end

    def run
      send_commands_to_simulator
    end

    private

    def parse_commands(file_name)
      File.read(file_name).split("\n").map(&:split)
    end

    def send_commands_to_simulator
      @commands.each do |command|
        command_method = command.first.downcase.to_sym
        command_args = parse_command_args(command[1])

        @simulator.send(command_method, *command_args)
      end
    end

    def parse_command_args(unparsed_args)
      return if unparsed_args.nil?

      unparsed_args.split(',').map do |arg|
        # The check for integer numericality of args comes from Ruby on Rails, source:
        # https://apidock.com/rails/ActiveModel/Validations/ClassMethods/validates_numericality_of
        is_numerical = arg.to_s =~ /\A[+-]?\d+\Z/

        is_numerical ? arg.to_i : arg
      end
    end
  end
end
