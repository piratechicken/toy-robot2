# frozen_string_literal: true

module ToyRobot
  class Simulator
    def initialize
      @table = Table.new
    end

    def place(x, y, facing)
      return unless valid_placement?(x, y, facing)

      @robot = Robot.new(x, y, facing)
    end

    def left
      drive_robot(:left)
    end

    def right
      drive_robot(:right)
    end

    def move
      drive_robot(:move)
    end

    def report
      report = @robot.nil? ? 'No robot placed' : @robot.report

      puts report
    end

    private

    def drive_robot(command)
      return if @robot.nil?

      case command
      when :move
        robot_move
      when :left
        @robot.turn_left
      when :right
        @robot.turn_right
      end
    end

    def robot_move
      return unless @table.valid_position?(*@robot.project_move)

      @robot.move
    end

    def valid_placement?(x, y, facing)
      @table.valid_position?(x, y) && Robot.valid_facing?(facing)
    end
  end
end
