class Food
  def initialize(food_item, price)
    @food_item = food_item
    @price = price
  end

  def food
     @food_item.to_s
  end

  def price
    @price.to_f
  end
end

