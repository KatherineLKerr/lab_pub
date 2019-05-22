require("minitest/autorun")
require("minitest/rg")

require_relative("../pub")
require_relative("../customer")
require_relative("../drink")


class PubTest < MiniTest::Test


  def setup
    @drink1 = Drink.new("pint", 3, 1)
    @drink2 = Drink.new("gin and tonic", 5, 2)
    @drink3 = Drink.new("cider", 2, 1)
    @drink4 = Drink.new("pinta", 3, 1)
    @drink5 = Drink.new("pint", 3, 1)

    @customer1 = Customer.new("Katherine", 22, 50)
    @customer2 = Customer.new("Steve", 16, 50)

    @pub = Pub.new("4042", 200, [@drink1, @drink2, @drink3, @drink4, @drink5])
  end

  def test_has_name
    assert_equal("4042", @pub.name)
  end

  def test_till
    assert_equal(200, @pub.till)
  end

  def test_drinks
    assert_equal([@drink1, @drink2, @drink3], @pub.pub_drinks)
  end

  # def test_remove_drink
  #    @pub.remove_drink("pint")
  #   assert_equal([@drink2, @drink3], @pub.pub_drinks)
  # end

  def test_give_drink
    drinks_left = [@drink2, @drink3]
    assert_equal(@drink1, @pub.give_drink(@customer1, "pint" ) )
    assert_equal(drinks_left, @pub.pub_drinks)
  end

  # def test_customer_age
  #
  #   assert_equal("You can drink", @pub.customer_age(@customer1) )
  # end

  def test_under_age
    assert_equal("Sorry, not today pal.", @pub.give_drink(@customer2, "pint"))
    assert_equal([@drink1, @drink2, @drink3], @pub.pub_drinks)
    assert_equal([], @customer2.customer_drinks)
  end

  def test_of_age
    assert_equal(@drink1, @pub.give_drink(@customer1, "pint"))
    assert_equal([@drink2, @drink3], @pub.pub_drinks)
  end

  def test_wrong_drink
    assert_equal("Sorry, choose another drink", @pub.give_drink(@customer1, "fdsg"))
    assert_equal([@drink1, @drink2, @drink3], @pub.pub_drinks)
  end

  def test_money_in
    @pub.give_drink(@customer1, "pint")
    assert_equal(203, @pub.till)
  end



end
