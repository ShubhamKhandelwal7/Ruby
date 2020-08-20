class String
  def to_s
    swapcase
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  ARGV.each do |str|
    print str.to_s + ' '
  end
end
