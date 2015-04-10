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
    constant_name = feature_name.underscore.upcase.gsub(' ', '_')
    constant = const_set(constant_name, feature_name)
    ALL_FEATURES << constant
  end
end
