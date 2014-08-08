require 'test/unit'
require_relative '../plateau.rb'
require_relative '../rover_driver.rb'

class RoverDriverTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @plateau1 = Plateau.new(5, 5)
    @rover_driver = RoverDriver.new(@plateau1, 1, 1, :N)
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_rover_mover_single_move
    output = @rover_driver.move("M")
    position = output.split(" ")
    assert_equal 1, position[0].to_i
    assert_equal 2, position[1].to_i
    assert_equal :N, position[2].to_sym
  end

  def test_rover_mover_single_rotate_left
    output = @rover_driver.move("L")
    position = output.split(" ")
    assert_equal 1, position[0].to_i
    assert_equal 1, position[1].to_i
    assert_equal :W, position[2].to_sym
  end

  def test_rover_mover_single_rotate_right
    output = @rover_driver.move("R")
    position = output.split(" ")
    assert_equal 1, position[0].to_i
    assert_equal 1, position[1].to_i
    assert_equal :E, position[2].to_sym
  end

  def test_rover_mover_multi_move
    output = @rover_driver.move("MMM")
    position = output.split(" ")
    assert_equal 1, position[0].to_i
    assert_equal 4, position[1].to_i
    assert_equal :N, position[2].to_sym
  end

  def test_rover_mover_multi_rotate_left
    output = @rover_driver.move("LLL")
    position = output.split(" ")
    assert_equal 1, position[0].to_i
    assert_equal 1, position[1].to_i
    assert_equal :E, position[2].to_sym
  end

  def test_rover_mover_multi_rotate_right
    output = @rover_driver.move("RRRR")
    position = output.split(" ")
    assert_equal 1, position[0].to_i
    assert_equal 1, position[1].to_i
    assert_equal :N, position[2].to_sym
  end

  def test_rover_mover_mixed
    output = @rover_driver.move("LLMRR")
    position = output.split(" ")
    assert_equal 1, position[0].to_i
    assert_equal 0, position[1].to_i
    assert_equal :N, position[2].to_sym
  end

  def test_rover_mover_invalid_moves
    assert_raise(InvalidMoveError) do
      output = @rover_driver.move("RRMM")
    end
  end

end