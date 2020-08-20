class Array
  def power(value)
    map { |item| item.to_i**value.to_i }
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  arr = Array(ARGV[0].tr('" []', '').split(','))
  print arr.power(ARGV[1])
end
