require '../examples'

# A note on Ruby's Access Control:
# http://www.skorks.com/2010/04/ruby-access-control-are-private-and-protected-methods-only-a-guideline/
class SendExample

  public

  def public_method
    puts "I'm public"
  end

  protected

  def protected_method
    puts "I'm protected"
  end

  private

  def private_method
    puts "I'm private"
  end

end

send_example = SendExample.new

print_header('Using send')

puts "Call to public method:"
send_example.public_method
puts "\n"

begin
  puts "Call to protected method:"
  send_example.protected_method
rescue => e
  puts e.message.red
  send_example.send(:protected_method)
  puts "\n"
end

begin
  puts "Call to private method:"
  send_example.private_method
rescue => e
  puts e.message.red
  send_example.send(:private_method)
  puts "\n"

end
