require 'test/unit'
require_relative '../plateau.rb'

class PlateauTest < Test::Unit::TestCase

  def test_check_invalid_point
    plateau1 = Plateau.new(2, 2)
    assert_equal true, plateau1.isValid(0, 1)
    assert_equal true, plateau1.isValid(0, 0)
    assert_equal true, plateau1.isValid(1, 1)
  end

  def test_check_invalid_points
    plateau2 = Plateau.new(1, 3)
    assert_equal false, plateau2.isValid(0, 3)
    assert_equal false, plateau2.isValid(1, 2)
    assert_equal false, plateau2.isValid(1, 3)
    assert_equal false, plateau2.isValid(90, 100)
  end
end