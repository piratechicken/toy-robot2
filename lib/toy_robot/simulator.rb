# frozen_string_literal: true

module ToyRobot
  class Simulator
    def initialize
      @table = Table.new
    end

    def place_robot(x, y, facing)
      return unless valid_placement?(x, y, facing)

      @robot = Robot.new(x, y, facing)
    end

    def report
      return 'No robot placed' if @robot.nil?

      @robot.report
    end

    def drive_robot(command)
      return if @robot.nil?

      case command
      when :move
        robot_move
      when :left
        robot_left
      when :right
        robot_right
      end
    end

    private

    def robot_left
      @robot.turn_left
    end

    def robot_right
      @robot.turn_right
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
