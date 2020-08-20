class String
  def palindrome?
    self == reverse
  end
end

if ARGV.empty?
  puts 'Please provide an input'
elsif ARGV[0].palindrome?
  puts 'Input string is a palindrome'
else
  puts 'Input string is not a palindrome'
end
