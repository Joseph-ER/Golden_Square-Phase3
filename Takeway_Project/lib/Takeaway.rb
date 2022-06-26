class Takeaway
  def initialize
    @menu = [
      { :item_no => 1,:food => "Soup", :price => 7.00},
      { :item_no => 2, :food => "Cake", :price => 5.00},
      { :item_no => 3, :food => "Croissant", :price => 6.00},
      { :item_no => 4 ,:food => "Coffee", :price => 7.00},
      { :item_no => 5 ,:food => "Tea", :price => 7.00},
      { :item_no => 6, :food => "Flapjack", :price => 7.00}
    ]
  end

  def Show_menu
    show_menu = []
    @menu.each do |item|
      show_menu << item[:food]
      show_menu <<  item[:price]
    end
    show_menu.join(", ")
  end

  def order

  end
end

takeaway = Takeaway.new
p takeaway.Show_menu




# Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.