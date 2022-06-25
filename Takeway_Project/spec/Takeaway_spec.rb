class Takeaway
  def initialize(io)
    @io = io
    @menu = []
  end

  def add(item)
    @menu.push(item)
    #@menu.push(item)
  end

  def show_menu
    fail "Empty menu!" if @menu.length == 0
    #  @menu.join("-")
    @menu.each do |item|
      #@io.puts item.food
      @io.puts "Food- #{item.food}, price- #{item.price}"
    end
  end

  def order
    @orders = []
    loop do
      @io.puts "Please enter a number to order an item. 0 to finish ordering"
      user_choice = @io.gets.to_i
      break if user_choice == 0
      @orders.push(@menu[user_choice])
    end
    @io.puts "Order complete"
  end

  def view_order
    @bill = 0.0
    @orders.each do |item|
      @bill += item.price
      @io.puts "Item- #{item.food}"
    end
    @io.puts "Total price- #{@bill}"
  end
end



#-----------------------------------------------

require 'food'

RSpec.describe Takeaway do
  describe "add_item# method" do
    it "populates menu without error " do
      io = double :io
      takeaway = Takeaway.new(io)
      food = Food.new("Croissant", 3.5)
      expect { takeaway.add(food)}.not_to raise_error
    end
  end

  describe "show_menu# " do
    it "returns error if empty menu" do
      io = double :io
      tk = Takeaway.new(io)
      expect {tk.show_menu }.to raise_error "Empty menu!"
    end


    it "shows menu of 3 items " do
      io = double :io
      tk = Takeaway.new(io)
      food1 = Food.new("croissant", 3.5)
      food2 = Food.new("coffee",3.0)
      food3 = Food.new("bagel", 5.0)
      tk.add(food1)
      tk.add(food2)
      tk.add(food3)
      allow(io).to receive(:puts).with("Food- croissant, price- 3.5")
      allow(io).to receive(:puts).with("Food- coffee, price- 3.0")
      allow(io).to receive(:puts).with("Food- bagel, price- 5.0")
      tk.show_menu
    end
  end

  describe "order# method" do
    it "returns no error" do
      io = double :io
      tk = Takeaway.new(io)
      food1 = Food.new("croissant", 3.5)
      tk.add(food1)
      
      expect(io).to receive(:puts).with("Please enter a number to order an item. 0 to finish ordering")
      expect(io).to receive(:gets).and_return(1)
      expect(io).to receive(:puts).with("Please enter a number to order an item. 0 to finish ordering")
      expect(io).to receive(:gets).and_return(0)
      expect(io).to receive(:puts).with("Order complete")
      expect{tk.order}.not_to raise_error
    end


    it "returns order_list with total bill" do
      io = double :io
      tk = Takeaway.new(io)
      food1 = Food.new("croissant", 3.5)
      tk.add(food1)
      
      expect(io).to receive(:puts).with("Please enter a number to order an item. 0 to finish ordering")
      expect(io).to receive(:gets).and_return(1)
      expect(io).to receive(:puts).with("Please enter a number to order an item. 0 to finish ordering")
      expect(io).to receive(:gets).and_return(0)
      expect(io).to receive(:puts).with("Order complete")
      expect(io).to receive(:puts).with("Item- croissant")
      expect(io).to receive(:puts).with("Total price- 3.5")

      tk.order
      tk.view_order
    end
  end
end