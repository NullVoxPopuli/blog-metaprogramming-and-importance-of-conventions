require '../examples'

# for a more fleshed out example, see
# https://github.com/NullVoxPopuli/authorizable
#
# specifically, this class
# https://github.com/NullVoxPopuli/authorizable/blob/master/lib/authorizable/model.rb
#
# which defines a concern for ActiveModels who which to implement
# permissable functionality
class User

  PERMISSIONS = {
    update_foo: true,
    update_bar: false,
    delete_foo: false,
    delete_bar: true
  }

  def method_missing(name, *args, &block)
    string_name = name.to_s

    # does the method match the permission format
    if string_name =~ /can_(.+)\?/
      permission_name = $1
      puts "  permission_name: #{permission_name}".light_yellow

      # retrieve the permission allowance from the pre-defined hash
      return PERMISSIONS[permission_name.to_sym]
    else
      super
    end
  end

  # the convention for permission names is:
  # can_#{action}_#{lower_case_object_name}?
  # so given only the action and instance of an object,
  # the permission can be derived.
  def can_for?(permission, object)
    send("can_#{permission}_#{object.class.name.downcase}?")
  end

end

class Foo; end
class Bar; end


def output_example_call(code, &block)
  puts "> ".green + "#{code}"
  ap yield
  puts "\n"
end

print_header('Dynamic Proxy Using method_missing')

user = User.new
foo = Foo.new
bar = Bar.new

output_example_call("user.can_update_foo?") { user.can_update_foo? }
output_example_call("user.can_delete_foo?") { user.can_delete_foo? }
output_example_call("user.can_for?(:update, bar)") { user.can_for?(:update, bar) }
output_example_call("user.can_for?(:delete, bar)") { user.can_for?(:delete, bar) }
