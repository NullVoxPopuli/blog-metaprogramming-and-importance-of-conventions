require '../examples'
require './features'
require './car'
require './delorean'
require './tesla'

puts "For the DeLorean".yellow
best_car = DeLorean.new
assert_false best_car.has_moon_roof?
assert_true best_car.has_flux_capacitor?
assert_true best_car.has_gull_wing_doors?
assert_true best_car.has_windows?

puts "\n"
puts "For the Tesla".yellow
expensive_car = Tesla.new
assert_true expensive_car.has_moon_roof?
assert_false expensive_car.has_flux_capacitor?
assert_false expensive_car.has_gull_wing_doors?
assert_true expensive_car.has_windows?
assert_true expensive_car.has_turbo?
