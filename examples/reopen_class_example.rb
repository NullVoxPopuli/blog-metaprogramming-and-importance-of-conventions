require '../examples'

class String

  def angrify!
     replace(self.angrify)
  end

  def angrify
    self.upcase + "!!!"
  end
end


print_header('Re-opening a class')

string = "I never lose. Either I win or I learn."
puts "Original"
puts string.yellow
puts "Angry:"
string.angrify!
puts string.red
