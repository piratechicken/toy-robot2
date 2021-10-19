# frozen_string_literal: true

module ToyRobot
  class Table
    def initialize(size = 5)
      @x_y_positions = Array(0..size - 1)
    end

    def valid_position?(x, y)
      @x_y_positions.include?(x) && @x_y_positions.include?(y)
    end
  end
end
