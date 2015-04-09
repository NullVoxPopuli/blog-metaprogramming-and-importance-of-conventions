require '../examples'

class DynamicMethodExample

  CARS = [
    "Honda",
    "Ford",
    "Chevrolet",
    "Tesla",
    "Lamborghini"
  ]

  CARS.each do |car|
    method_name = car.downcase
    define_method method_name do |*args|
      print "#{car} goes vroom... "
      print "with #{args.join(' ')}" if args.present?
      print "\n"
    end
  end

end


print_header('Dynamic Method Definition')

example = DynamicMethodExample.new

example.honda
example.tesla
example.ford("some wheels missing")


puts "\nWhat about at the class level?"
begin
  DynamicMethodExample.honda
rescue NoMethodError => e
  puts e.message.red
  puts "define_method in this context only works at the instance level"
end

puts "\n\n"
