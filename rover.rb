require_relative './invalid_move_error.rb'

class Rover

  attr_reader :x_cord
  attr_reader :y_cord
  attr_reader :direction

  def initialize(plateau, x_cord, y_cord, direction)
    raise InvalidMoveError.new("Invalid initial position") unless plateau.isValid(x_cord, y_cord)
    #puts "Rover being initialized at #{x_cord}, #{y_cord} facing #{direction}."
    @plateau = plateau
    @x_cord = x_cord
    @y_cord = y_cord
    @direction = direction
  end

  def rotateLeft
    case @direction
      when :N
        @direction = :W
      when :W
        @direction = :S
      when :S
        @direction = :E
      when :E
        @direction = :N
      else
        raise InvalidMoveError.new("Invalid direction for the rover")
    end
    #puts "New direction is #{@direction}"
  end


  def rotateRight
    case @direction
      when :N
        @direction = :E
      when :E
        @direction = :S
      when :S
        @direction = :W
      when :W
        @direction = :N
      else
        raise InvalidMoveError.new("Invalid direction for the rover")
    end
    #puts "New direction is #{@direction}"
  end

  def move
    case @direction
      when :N
        @y_cord += 1
      when :S
        @y_cord -= 1
      when :W
        @x_cord += 1
      when :E
        @x_cord -= 1
    end
    raise InvalidMoveError.new("Invalid move by the rover") unless @plateau.isValid(@x_cord, @y_cord)
    #puts "New point is (#{@x_cord},#{@y_cord})"
  end

end