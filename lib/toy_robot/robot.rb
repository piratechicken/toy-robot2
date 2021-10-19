# frozen_string_literal: true

module ToyRobot
  class Robot
    attr_reader :x, :y, :facing

    def initialize(x, y, facing)
      @x = x
      @y = y
      @facing = facing
    end

    def move
      case facing
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

    def turn_left
      case facing
      when 'NORTH'
        @facing = 'WEST'
      when 'SOUTH'
        @facing = 'EAST'
      when 'EAST'
        @facing = 'NORTH'
      when 'WEST'
        @facing = 'SOUTH'
      end
    end

    def turn_right
      case facing
      when 'NORTH'
        @facing = 'EAST'
      when 'SOUTH'
        @facing = 'WEST'
      when 'EAST'
        @facing = 'SOUTH'
      when 'WEST'
        @facing = 'NORTH'
      end
    end

    def position
      "#{@x},#{@y}"
    end
  end
end
