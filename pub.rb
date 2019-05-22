class Pub
  attr_reader :name
  attr_accessor :till, :pub_drinks

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @pub_drinks = drinks
  end

  # def remove_drink(drink_name)
  #   for drink in @pub_drinks
  #     if (drink.name == drink_name)
  #       @pub_drinks.delete(drink)
  #     end
  #   end
  #   return drink
  # end

  def give_drink(customer, drink_name)
    if (customer.age < 18) || (customer.drunkenness_level > 4)
      return "Sorry, not today pal."
    end
    for drink in @pub_drinks
      if (drink.name == drink_name)
        @pub_drinks.delete(drink)
        customer.get_drink(drink)
        @till += drink.price
        return drink
      end
    end
    return "Sorry, choose another drink"
  end

  # def customer_age(customer)
  #   if customer.age >= 18
  #     return customer.give_drink(drink_name)
  #   else
  #     return
  #   end
  # end



end
