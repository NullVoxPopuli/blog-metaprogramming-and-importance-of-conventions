require '../examples'

class Foo

  def initialize(value = "set on initialize")
    @variable = value
  end

  def get_variable
    @variable
  end

end


print_header('Singleton Class Example')

foo = Foo.new

# do something only to this instance of foo
# this syntax,
#
# class << self
#   self
# end
#
# is long hand for foo.singleton_class
class << foo
  # inside here, it is as if we are defining the Foo class,
  # as at the top of this example, but everything in here
  # only applies to the instance of foo

  # only this instance will have this method
  def set_variable(value)
    @variable = value
  end
end

ap foo.set_variable("woo!")

# try on a new instance
begin
  ap Foo.new.set_variable("nope")
rescue NameError => e
  puts e.message.red
end
