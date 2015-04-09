require '../examples'

class << self
  # this turns ruby in to a bare words langugae
  def method_missing(*args)
    args.join(" ")
  end
end


print_header('Lets Break Everything')
puts "overriding method_missing on the object level is generally a bad idea\n\n"

input = ''
puts "Entering interactive mode.. type exit to ... exit\n\n"

while !('exit' == input) do

  # generally considered a dangerous method
  # lets you run strings as rubys
  # http://ruby-doc.org/core-2.2.1/Kernel.html#method-i-eval
  unless input.blank?
    result = eval(input)
    ap result
  end

  print "\n> ".green
  input = gets
end


# for example, when this runs, you could type
#
# > 2+2
# 4
#
# > wat("hi")
# "wat hi"
#
# > well hello there
# "well hello there"
