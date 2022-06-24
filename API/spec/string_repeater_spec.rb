# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run

class StringRepeater
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will repeat a string many times."
    @io.puts "Please enter a string"
    text = @io.gets.chomp
    @io.puts "Please enter a number of repeats"
    repeats = @io.gets.to_i
    @io.puts "Here is your result:"
    @io.puts (text*repeats)
  end
end

RSpec.describe StringRepeater do
  it "repeats the inputted string" do
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")
    expect(io).to receive(:puts).with("Please enter a string")
    expect(io).to receive(:gets).and_return("Joe")
    expect(io).to receive(:puts).with("Please enter a number of repeats")
    expect(io).to receive(:gets).and_return(3)
    expect(io).to receive(:puts).with("Here is your result:")
    expect(io).to receive(:puts).with("Joe"*3)

    test = StringRepeater.new(io)
    test.run
  end
end




# Hello. I will repeat a string many times.
# Please enter a string
# TWIX
# Please enter a number of repeats
# 10
# Here is your result:
# TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX