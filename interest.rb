class Interest
  FORMAT_TYPE = '%.2f'.freeze
  RATE_OF_INTEREST = 10.0
  PERCENT_100 = 100
  ROUND_TO = 2
  OUTPUT_STRING = 'Interest difference= '.freeze
  FORMULA_NUMBER_1 = 1.0

  attr_accessor :principal, :time
  def initialize
    yield self
  end

  def calc_interest
    calc_difference(simple_interest, compound_interest)
    show_interest
  end

  def simple_interest
    simple_interest = (@principal * RATE_OF_INTEREST * @time) / PERCENT_100
    @principal + simple_interest
  end

  def compound_interest
    @principal * ((FORMULA_NUMBER_1 + RATE_OF_INTEREST / PERCENT_100)**@time)
  end

  def calc_difference(simple_amount, compound_amount)
    @interest_difference = (compound_amount - simple_amount).round(ROUND_TO)
  end

  def show_interest
    "#{OUTPUT_STRING}#{format(FORMAT_TYPE, @interest_difference)}"
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  interest_obj = Interest.new do |interest|
    interest.principal = ARGV[0].to_f
    interest.time = ARGV[1].to_f
  end
  puts interest_obj.calc_interest
end
