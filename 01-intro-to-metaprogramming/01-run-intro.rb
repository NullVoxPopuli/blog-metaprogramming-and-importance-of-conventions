require '../examples'
require 'features'
require 'car'
require 'car2'
require 'delorean'
require 'tesla'

best_car = DeLorean.new
puts best_car.has_moon_roof? # false
puts best_car.has_flux_capacitor? # true
puts best_car.has_gull_wing_doors? # true
puts best_car.has_windows? # true

expensive_car = Tesla.new
puts expensive_car.has_moon_roof? # true
puts expensive_car.has_flux_capacitor? # false
puts expensive_car.has_gull_wing_doors? # false
puts expensive_car.has_windows? # true
puts expensive_car.has_turbo? # true
