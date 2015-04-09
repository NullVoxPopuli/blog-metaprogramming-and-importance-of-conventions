require '../examples'

# for more information on the difference between class_eval and instance_eval
# http://www.jimmycuadra.com/posts/metaprogramming-ruby-class-eval-and-instance-eval
class Foo

  def initialize(value = "set on initialize")
    @variable = value
  end

  # calling singleton_class is the same as
  #
  # class << self
  #   self
  # end
  def singleton_instance_eval(&block)
   singleton_class.instance_eval(&block)
 end

end


print_header('Instance Eval Example')

foo = Foo.new

foo.singleton_instance_eval do
  # defines a method as if we were still in
  # class Foo
  define_method(:hello_world){ "hi "}
end

ap foo.hello_world

begin
  ap Foo.new.hello_world
rescue NoMethodError => e
  puts e.message.red
end


# there is another way to use instance_eval, without the singleton_class
# there is another way to use class_eval, and that is not on the singleton_class
Foo.instance_eval do
  # defining methods within the Foo class
  def true?
    true
  end
end

ap Foo.true?

begin
  ap Foo.new.true?
rescue NameError => e
  puts e.message.red
end
