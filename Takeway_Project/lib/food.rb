class Food
  def initialize(food_item, price, item_no)
    @food_item = food_item
    @price = price
    @item_no= item_no
  end

  def food
     @food_item.to_s
  end

  def price
    @price.to_f
  end

  def item_num
    @item_no.to_i
  end
end

