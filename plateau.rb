class Plateau

  attr_reader :x_max
  attr_reader :y_max

  def initialize(x_max, y_max)
    #puts "Creating Plateau (0,0) to (#{x_max},#{y_max})."
    @x_max = x_max
    @y_max = y_max
  end

  def isValid(x, y)
    if (x < 0 || x >= @x_max)
      return false
    elsif (y < 0 || y >= @y_max)
      return false
    end
    return true
  end
end