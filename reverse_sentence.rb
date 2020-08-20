class String
  def reverse_order_of_words
    string_to_reverse = dup
    string_to_reverse.split(' ').reverse.join(' ')
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  print ARGV[0].reverse_order_of_words
end
