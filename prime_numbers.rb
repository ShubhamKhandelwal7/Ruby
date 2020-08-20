class PrimeNumbers
  def initialize(max)
    @max = max.to_i
  end

  def find_prime_in_range
    return [] if @max < 2
    arr = [2]
    3.step(@max, 2) do |num|
      arr.push(num) if ((2...num).none? { |test| num % test == 0 })
    end
    arr
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  prime_numbers = PrimeNumbers.new(ARGV[0])
  print prime_numbers.find_prime_in_range
end
