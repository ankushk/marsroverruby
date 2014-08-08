require_relative './rover.rb'

class RoverDriver

  def initialize(plateau, x_cord, y_cord, direction)
    @rover = Rover.new(plateau, x_cord, y_cord, direction)
  end

  def move(move_sequence)
    move_sequence.chars.each do |move|
      case move
      when 'M'
        #puts "Moving rover"
        @rover.move
      when 'L'
        #puts "Rotating left"
        @rover.rotateLeft
      when 'R'
        #puts "Rotating right"
        @rover.rotateRight
      else
        puts "Invalid character in the move sequence!"
      end
    end
    return "#{@rover.x_cord} #{@rover.y_cord} #{@rover.direction.to_s}"
  end

end