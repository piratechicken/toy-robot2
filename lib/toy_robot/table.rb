# frozen_string_literal: true

module ToyRobot
  class Table
    DEFAULT_SIZE = 5

    def initialize(size = DEFAULT_SIZE)
      @x_y_range = 0...size
    end

    def valid_position?(x, y)
      @x_y_range.include?(x) && @x_y_range.include?(y)
    end
  end
end
