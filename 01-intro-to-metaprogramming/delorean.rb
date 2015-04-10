class DeLorean
  include Features

  FEATURES = [
    FLUX_CAPACITOR, FLYING, GULL_WING_DOORS,
    WHEELS, WINDOWS, AIR_CONDITIONING
  ]

  # iterate through all of the features
  ALL_FEATURES.each do |feature|
    method_name = "has_#{feature}?"

    # define the method that checks if this model of car has the
    # requested feature.
    # see: http://ruby-doc.org/core-2.2.0/Module.html#method-i-define_method
    define_method method_name do
      FEATURES.include?(feature)
    end
  end
end
