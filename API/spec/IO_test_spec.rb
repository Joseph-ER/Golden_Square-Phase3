class Greeter
  def initialize(io)
    @io = io
  end

  def greet
    @io.puts "What is your name?"
    name = @io.gets.chomp
    @io.puts "Hello, #{name}!"
  end
end

RSpec.describe Greeter do
  it "greets the user" do
    io = double :io
    expect(io).to receive(:puts).with("What is your name?")
    expect(io).to receive(:gets).and_return("Joe")
    expect(io).to receive(:puts).with("Hello, Joe!")

    greeter = Greeter.new(io)
    greeter.greet
  end
end

# If we want to run `Greeter` for real, we do it like this
# greeter = Greeter.new(Kernel)
# greeter.greet