require '../examples'

module Features
  feature_names = ["Wheels", "Windows", "Air Conditioning",
    "Gull-Wing Doors", "Flux Capacitor",
    "Moon Roof", "Turbo", "Flying", "Touch Screen"
  ]

  ALL_FEATURES = []

  # define constants so we don't have to reference
  # anything by a string, which is prone to error
  feature_names.each do |feature_name|
    # e.g.: "Flux Capacitor" => "FLUX_CAPACITOR"
    constant_name = feature_name.underscore.upcase
    constant = const_set(constant_name, feature_name)
    ALL_FEATURES << constant
  end
end

class DeLorean
  include Features

  # constant defining the features that this
  # particular car has
  FEATURES = [
    FLUX_CAPACITOR, FLYING, GULL_WING_DOORS,
    WHEELS, WINDOWS, AIR_CONDITIONING
  ]

  # iterate through all of the features
  ALL_FEATURES.each do |feature|
    # the feature is written as english,
    # convert to valid method name syntax.
    # see: http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html
    method_base_name = feature.underscore

    method_name = "has_#{method_base_name}?"

    # define the method that checks if this model of car has the
    # requested feature.
    # see: http://ruby-doc.org/core-2.2.0/Module.html#method-i-define_method
    define_method method_name do
      FEATURES.include?(feature)
    end
  end


end
