class Car
  include Features

  def method_missing(name, *args, &block)
    # does the method match the has_feature? format
    if name.to_s =~ /has_(.+)\?/
      # get the value from the regex capture
      feature_name = $1

      # The features array is of symbols
      constant_value = feature_name.to_sym

      # use our current class, self, rather than Car
      # without self.class, FEATURES is assumed to be in Car,
      # rather than in the instance that inherits from Car
      return self.class::FEATURES.include?(constant_value)
    else
      super
    end
  end
end
