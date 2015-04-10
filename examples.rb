# include gems
require 'bundler'
Bundler.require

def print_header(title)
  title_with_padding = ' ' * 5 + title + ' ' * 5
  length = title_with_padding.length
  divider = '-' * length

  puts divider.purple
  puts title_with_padding.purple
  puts divider.purple
  puts "\n\n"
end

def assert_true(value)
  if value
    puts value.to_s.green
  else
    puts value.to_s.red
  end
end

def assert_false(value)
  if !value
    puts value.to_s.green
  else
    puts value.to_s.red
  end
end