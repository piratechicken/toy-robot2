# frozen_string_literal: true

module ToyRobot
  class Table
    def initialize(size = 5)
      @x_y_range = 0...size
    end

    def valid_position?(x, y)
      @x_y_range.include?(x) && @x_y_range.include?(y)
    end
  end
end
