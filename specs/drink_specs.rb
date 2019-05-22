require("minitest/autorun")
require("minitest/rg")

require_relative("../drink")

class DrinkTest < MiniTest::Test


  def setup
    @drink1 = Drink.new("pint", 3, 1)
  end

  def test_has_name
    assert_equal("pint", @drink1.name)
  end

  def test_price
    assert_equal(3, @drink1.price)
  end

  def test_alcohol_level
    assert_equal(1, @drink1.alcohol_level)
  end


end
