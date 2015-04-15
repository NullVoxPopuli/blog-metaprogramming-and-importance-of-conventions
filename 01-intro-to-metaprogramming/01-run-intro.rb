require '../examples'
require './features'
require './car'
require './delorean'
require './tesla'

puts "For the DeLorean".yellow
best_car = DeLorean.new
assert_false best_car.has_moon_roof? # => false
assert_true best_car.has_flux_capacitor? # => true
assert_true best_car.has_gull_wing_doors? # => true
assert_true best_car.has_windows? # => true

puts "\n"
puts "For the Tesla".yellow
expensive_car = Tesla.new
assert_true expensive_car.has_moon_roof? # => true
assert_false expensive_car.has_flux_capacitor? # => false
assert_false expensive_car.has_gull_wing_doors? # => false
assert_true expensive_car.has_windows? # => true
assert_true expensive_car.has_turbo? # => true
