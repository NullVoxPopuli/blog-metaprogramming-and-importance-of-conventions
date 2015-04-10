module Features
  feature_names = [:wheels, :windows, :air_conditioning,
    :gull_wing_doors, :flux_capacitor, 
    :moon_roof, :turbo, :flying, :touch_screen
  ]

  ALL_FEATURES = []

  # define constants so we don't have to reference
  # anything by a string, which is prone to error
  feature_names.each do |feature_name|
    # e.g.: :flux_capacitor => "FLUX_CAPACITOR"
    constant_name = feature_name.to_s.upcase
    # dynamically set a constant with the value of feature_name
    constant = const_set(constant_name, feature_name)

    # append to list of all features
    ALL_FEATURES << constant
  end
end
