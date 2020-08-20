class Integer
  def factorial
    (1..self).inject(1, :*)
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts ARGV[0].to_i.factorial
end
