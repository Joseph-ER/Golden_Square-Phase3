class Greeter
  def greet
    Kernel.puts "What is your name?"
    name= Kernel.gets.chomp
    Kernel.puts "Hello #{name}"
  end
end