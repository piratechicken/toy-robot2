# frozen_string_literal: true

module ToyRobot
  class Robot
    def initialize(x, y, facing)
      @x = x
      @y = y
      @facing = facing
    end

    def move
      case @facing
      when 'NORTH'
        @y += 1
      when 'SOUTH'
        @y -= 1
      when 'EAST'
        @x += 1
      when 'WEST'
        @x -= 1
      end
    end

    def position
      "#{@x},#{@y}"
    end
  end
end
