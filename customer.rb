class Customer
  attr_reader :name, :wallet, :age, :customer_drinks
  attr_accessor :drunkenness_level

  def initialize(name, age, wallet)
    @name = name
    @age = age
    @wallet = wallet
    @customer_drinks = []
    @drunkenness_level = 0
  end


  def get_drink(drink)
    # for drink in pub.pub_drinks
      # if drink.name == drink_name
        # @customer_drinks << pub.give_drink(self, drink_name)
        @wallet -= drink.price
        # pub.pay(drink.price)
        @customer_drinks << drink
        @drunkenness_level += drink.alcohol_level
        # pub.till += drink.price
      # end
    # end
    return @customer_drinks
  end





end
