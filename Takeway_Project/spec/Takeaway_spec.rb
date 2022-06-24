class Takeaway
  def initialize(io)
    @io = io
    @menu = []
  end

  def add(item)
    @menu.push(item)
    @menu.push(item)
  end

  def show_menu
    #  @menu.join("-")
    @menu.each do |item|
      @io.puts item.food
      @io.puts item.price
    end
  end



end

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
    it "shows menu of 3 items " do
      io = double :io
      tk = Takeaway.new(io)
      food1 = Food.new("croissant", 3.5)
      food2 = Food.new("coffee",3.0)
      food3 = Food.new("bagel", 5.0)
      tk.add(food1)
      tk.add(food2)
      tk.add(food3)
      expect(io).to receive(:puts).with("Food- croissant, price- 3.5")
      expect(io).to receive(:puts).with("Food- coffee, price- 3.0")
      expect(io).to receive(:puts).with("Food- bagel, price- 5.0")
      expect(tk.show_menu).to eq ("Food- croissant, price- 3.5")
      tk.show_menu
    end
  end
end