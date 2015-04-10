class Car2
  include Features

  def method_missing(name, *args, &block)
    # does the method match the has_feature? format
    if name.to_s =~ /has_(.+)\?/
      # get the value from the regex capture
      feature_name = $1
      constant_value = feature_name.upcase

      return FEATURES.include?(constant_value)
    else
      super
    end
  end
end
