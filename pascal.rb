class PascalYield
  def initialize(val)
    @rows = val.to_i
  end

  def get_pascal(&block)
    (1..@rows).each do |each_row|
      row_calculation(each_row, &block)
    end
  end

  def row_calculation(each_row)
    value = 1
    1.upto(each_row) do |column|
      yield value
      value = value * (each_row - column) / column
    end
    puts ''
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  pascal_yield = PascalYield.new(ARGV[0])
  pascal_yield.get_pascal { |i| print "#{i} " }
end
