class FibonacciCreator
  def initialize(input_limit)
    @input_limit = input_limit.to_i
  end

  def create_series
    first_no = 0
    second_no = third_no = 1
    series = ''
    while @input_limit >= third_no
      series = "#{series}#{third_no} "
      third_no = first_no + second_no
      first_no = second_no
      second_no = third_no
    end
    series
  end
end
fibonacci_creator = FibonacciCreator.new(ARGV[0])
if ARGV[0].nil?
  puts 'Please provide an input'
else
  puts fibonacci_creator.create_series
end
