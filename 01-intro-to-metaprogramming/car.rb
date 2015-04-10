class Car
  include Features

  # iterate through all of the features
  ALL_FEATURES.each do |feature|
    # the feature is written as english,
    # convert to valid method name syntax.
    # see: http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html
    method_base_name = feature.underscore.gsub(' ', '_')

    method_name = "has_#{method_base_name}?"

    # define the method that checks if this model of car has the
    # requested feature.
    # see: http://ruby-doc.org/core-2.2.0/Module.html#method-i-define_method
    define_method method_name do
      FEATURES.include?(feature)
    end
  end
end
