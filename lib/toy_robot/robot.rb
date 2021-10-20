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

    def self.valid_facing?(facing)
      DIRECTIONS.include?(facing)
    end

    def project_move
      case facing
      when 'NORTH'
        [x, y + 1]
      when 'SOUTH'
        [x, y - 1]
      when 'EAST'
        [x + 1, y]
      when 'WEST'
        [x - 1, y]
      end
    end

    def move
      @x, @y = project_move
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
