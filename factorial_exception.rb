class Integer
  def factorial
    raise 'Negative number entered' if self < 0
    (1..self).inject(1, :*)
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  begin
    puts ARGV[0].to_i.factorial
  rescue RuntimeError => e
    puts e.message
  end
end
