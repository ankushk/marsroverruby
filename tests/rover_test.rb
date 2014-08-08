require 'test/unit'
require_relative '../plateau.rb'
require_relative '../rover.rb'

class RoverTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @plateau1 = Plateau.new(5, 5)
    @plateau2 = Plateau.new(1, 1)
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_rover_initialized
    rover1 = Rover.new(@plateau1, 0, 0, :N)
    assert_equal 0, rover1.x_cord, "Incorrect x coordinate"
    assert_equal 0, rover1.y_cord, "Incorrect y coordinate"
    assert_equal :N, rover1.direction, "Incorrect direction"
  end

  def test_rover_initialized_invalid_location
    assert_raise(InvalidMoveError) do
      rover2 = Rover.new(@plateau2, 1, 1, :E)
    end
  end

  def test_rover_valid_move
    rover1 = Rover.new(@plateau1, 0, 0, :N)
    rover1.move
    assert_equal 0, rover1.x_cord
    assert_equal 1, rover1.y_cord
    assert_equal :N, rover1.direction
  end

  def test_rover_invalid_move
    rover1 = Rover.new(@plateau1, 0, 0, :S)
    assert_raise(InvalidMoveError) do
      rover1.move
    end
  end

  def test_rover_valid_left_rotate
    rover1 = Rover.new(@plateau1, 0, 0, :N)
    rover1.rotateLeft
    assert_equal 0, rover1.x_cord
    assert_equal 0, rover1.y_cord
    assert_equal :W, rover1.direction
  end

  def test_rover_valid_left_rotate2
    rover1 = Rover.new(@plateau1, 0, 0, :W)
    rover1.rotateLeft
    assert_equal 0, rover1.x_cord
    assert_equal 0, rover1.y_cord
    assert_equal :S, rover1.direction
  end

  def test_rover_valid_right_rotate
    rover1 = Rover.new(@plateau1, 1, 1, :E)
    rover1.rotateRight
    assert_equal 1, rover1.x_cord
    assert_equal 1, rover1.y_cord
    assert_equal :S, rover1.direction
  end

  def test_rover_valid_right_rotate2
    rover1 = Rover.new(@plateau1, 1, 1, :S)
    rover1.rotateRight
    assert_equal 1, rover1.x_cord
    assert_equal 1, rover1.y_cord
    assert_equal :W, rover1.direction
  end

end