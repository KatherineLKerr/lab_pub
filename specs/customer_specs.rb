require("minitest/autorun")
require("minitest/rg")

require_relative("../customer")
require_relative("../drink")
require_relative("../pub")

class CustomerTest < MiniTest::Test


  def setup
    @drink1 = Drink.new("pint", 3, 1)
    @drink2 = Drink.new("gin and tonic", 5, 2)
    @drink3 = Drink.new("cider", 2, 1)
    @drink4 = Drink.new("pinta", 3, 1)
    @drink5 = Drink.new("pintb", 3, 1)

    @pub = Pub.new("4042", 200, [@drink1, @drink2, @drink3, @drink4, @drink5])

    @customer1 = Customer.new("Katherine", 22, 50)
    @customer2 = Customer.new("Steve", 16, 50)

  end

  def test_has_name
    assert_equal("Katherine", @customer1.name)
  end

  def test_wallet
    assert_equal(50, @customer1.wallet)
  end

  def test_get_drink
    @customer1.get_drink(@drink1)
    assert_equal([@drink1], @customer1.customer_drinks)
  end

  def test_money_out
    @customer1.get_drink(@drink1)
    assert_equal(47, @customer1.wallet)
  end

  def test_has_age
    assert_equal(22, @customer1.age)
  end

  def test_of_age_gain_drink
    @customer1.get_drink(@drink1)
    # assert_equal([@drink1], @customer1.customer_drinks)
  end

  def test_drunkenness_level
    assert_equal(0, @customer1.drunkenness_level)
  end

  def test_drunkenness_level__up
    @pub.give_drink(@customer1, "pint")
    @pub.give_drink(@customer1, "gin and tonic")
    @pub.give_drink(@customer1, "cider")
    @pub.give_drink(@customer1, "pinta")
    assert_equal(5, @customer1.drunkenness_level)
    assert_equal("Sorry, not today pal.", @pub.give_drink(@customer1, "pintb"))
  end

end
