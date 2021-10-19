# frozen_string_literal: true

module ToyRobot
  class Robot
    DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

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

    def report
      "#{x},#{y},#{facing}"
    end

    def turn_left
      new_facing_index = DIRECTIONS.find_index(facing) - 1

      turn(new_facing_index)
    end

    def turn_right
      new_facing_index = DIRECTIONS.find_index(facing) + 1

      turn(new_facing_index)
    end

    private

    def turn(new_facing_index)
      @facing = if new_facing_index >= DIRECTIONS.length
                  DIRECTIONS.first
                else
                  DIRECTIONS[new_facing_index]
                end
    end
  end
end
