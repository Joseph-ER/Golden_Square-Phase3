class InteractiveCalculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello, I will subtract number 1 from number 2"
    @io.puts "Please enter a number"
    num1 = @io.gets.to_i
    @io.puts "Please enter another number"
    num2 = @io.gets.to_i
    @io.puts "Here is your result:"
    total = num1 - num2
    @io.puts "#{num1} - #{num2} = #{total}"
  end
end

RSpec.describe InteractiveCalculator do
  it "subtracts a number from another" do
    io = double :io
    expect(io).to receive(:puts).with("Hello, I will subtract number 1 from number 2")
    expect(io).to receive(:puts).with("Please enter a number")
    expect(io).to receive(:gets).and_return(5)
    expect(io).to receive(:puts).with("Please enter another number")
    expect(io).to receive(:gets).and_return(3)
    expect(io).to receive(:puts).with("Here is your result:")
    expect(io).to receive(:puts).with("5 - 3 = 2")


    calc = InteractiveCalculator.new(io)
    calc.run
  end
end

# Hello. I will subtract two numbers.
# Please enter a number
# 4
# Please enter another number
# 3
# Here is your result:
# 4 - 3 = 1