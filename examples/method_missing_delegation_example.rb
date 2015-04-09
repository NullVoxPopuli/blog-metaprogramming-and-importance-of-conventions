require '../examples'

# This shows how method_missing can be used
# to delegate calls to another object
class MethodMissingDelegationExample

  def initialize
    @string = "There are no limitations to the mind except those we acknowledge."
  end

  def method_missing(name, *args, &block)
    if @string.present? and @string.respond_to?(name)
      @string.send(name, *args, &block)
    else
      super
    end
  end

end


print_header('Method Missing')

example = MethodMissingDelegationExample.new
puts "Delegating String#split"
ap example.split(" ")
puts "\n"
puts "Delegating a method taking a block"

possible_colors = [
  :black, :light_black,
 :red, :light_red,
 :green, :light_green,
 :yellow, :light_yellow,
 :blue, :light_blue,
 :magenta, :light_magenta,
 :cyan, :light_cyan,
 :white, :light_white,
]

total_colors = possible_colors.count

example.each_char{ |c|
  random_color = possible_colors[rand(total_colors)]
  color_character = c.send(random_color)
  print(color_character)
}
puts "\n\n"
