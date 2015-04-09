require '../examples'

# for more information on the difference between class_eval and instance_eval
# http://www.jimmycuadra.com/posts/metaprogramming-ruby-class-eval-and-instance-eval
class Foo

  def initialize(value = "set on initialize")
    @variable = value
  end

  def get_variable
    @variable
  end

  def singleton_class_eval(&block)
    singleton_class.class_eval(&block)
  end

end


print_header('Class Eval Example')

foo = Foo.new

# because this is on a singleton_class, it behaves the exact same as
# singleton_class.instance_eval
foo.singleton_class_eval do
  def say_hi
    "hi"
  end
end

ap foo.say_hi

begin
  ap Foo.new.say_hi
rescue NameError => e
  puts e.message.red
end


# there is another way to use class_eval, and that is not on the singleton_class
Foo.class_eval do
  # defining methods within the Foo class
  def true?
    true
  end
end

ap Foo.new.true?

begin
  ap Foo.true?
rescue NameError => e
  puts e.message.red
end
