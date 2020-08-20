class Array
  def reverse_iterate
    if block_given?
      current_index = size - 1
      while current_index >= 0
        yield self[current_index]
        current_index -= 1
      end
    else
      'No block given'
    end
  end
end

if ARGV[0].nil?
  puts 'Please provide an input'
else
  ARGV[0] = Array(ARGV[0].tr('\'[] ', '').split(','))
  puts ARGV[0].reverse_iterate { |i| print "#{i} " }
end