require 'twilio-ruby'

class Takeaway
  def initialize(io)
    @io = io
    @menu = []
  end

  def add(item)
    @menu.push(item)
  end

  def show_menu
    fail "Empty menu!" if @menu.length == 0
    @menu.each do |item|
      @io.puts "Food- #{item.food}, price- #{item.price}"
    end
  end

  def order
    @orders = []
    @bill = 0.0
    loop do
      @io.puts "Please enter a number to order an item. 0 to finish ordering"
      user_choice = @io.gets.to_i
      break if user_choice == 0
      @menu.each do |item|
        if item.item_num == user_choice
          @orders.push(item.food)
          @bill += item.price
        end
      end
    end
    @io.puts "Order complete"
  end

  def view_order
    return "Total price- #{@bill}"
  end



  def text_message
    account_sid = ""
    auth_token = ""
    client = Twilio::REST::Client.new(account_sid, auth_token)
    total = @bill.to_s
    
    from = '+' # Your Twilio number
    to = '+' # Your mobile phone number
    
    client.messages.create(
    from: from,
    to: to,
    body: "Your order totalling £#{total} is out for delivery from #{Time.now}"
    )

  end
end

#-----------------------------------------------

require 'food'

RSpec.describe Takeaway do
  describe "add_item# method" do
    it "populates menu without error " do
      io = double :io
      takeaway = Takeaway.new(io)
      food = Food.new("Croissant", 3.5, 1)
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
      food1 = Food.new("croissant", 3.5,1)
      food2 = Food.new("coffee",3.0,2)
      food3 = Food.new("bagel", 5.0,3)
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
      food1 = Food.new("croissant", 3.5,1)
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
      food1 = Food.new("croissant", 3.5, 1)
      tk.add(food1)
      
      expect(io).to receive(:puts).with("Please enter a number to order an item. 0 to finish ordering")
      expect(io).to receive(:gets).and_return(1)
      expect(io).to receive(:puts).with("Please enter a number to order an item. 0 to finish ordering")
      expect(io).to receive(:gets).and_return(0)
      expect(io).to receive(:puts).with("Order complete")

      tk.order
      expect(tk.view_order).to eq "Total price- 3.5"
    end


    it "returns order_list with total bill of multiple items" do
      io = double :io
      tk = Takeaway.new(io)
      food1 = Food.new("croissant", 3.5, 1)
      food2 = Food.new("coffee",3.0,1)
      food3 = Food.new("bagel", 5.0,1)
      tk.add(food1)
      tk.add(food2)
      tk.add(food3)
      
      expect(io).to receive(:puts).with("Please enter a number to order an item. 0 to finish ordering")
      expect(io).to receive(:gets).and_return(1)
      expect(io).to receive(:puts).with("Please enter a number to order an item. 0 to finish ordering")
      expect(io).to receive(:gets).and_return(2)
      expect(io).to receive(:puts).with("Please enter a number to order an item. 0 to finish ordering")
      expect(io).to receive(:gets).and_return(3)
      expect(io).to receive(:puts).with("Please enter a number to order an item. 0 to finish ordering")
      expect(io).to receive(:gets).and_return(0)
      expect(io).to receive(:puts).with("Order complete")

      tk.order
      expect(tk.view_order).to eq "Total price- 11.5"
    end
  end

  describe "send_text# method " do
    it "sends a text message" do
      io = double :io
      tk = Takeaway.new(io)
      food1 = Food.new("croissant", 3.5, 1)
      tk.add(food1)

      

      expect(io).to receive(:puts).with("Please enter a number to order an item. 0 to finish ordering")
      expect(io).to receive(:gets).and_return(1)
      expect(io).to receive(:puts).with("Please enter a number to order an item. 0 to finish ordering")
      expect(io).to receive(:gets).and_return(0)
      expect(io).to receive(:puts).with("Order complete")
      tk.order
      #expect(tk.text_message).to eq "Your order totalling £3.5 is out for delivery from #{Time.now}"
      expect{tk.text_message}.not_to raise_error
    end
  end
end