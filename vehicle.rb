class Vehicle
  def initialize(name, price)
    @name = name
    @price = price.to_i
  end

  def to_s
    puts "Bike Name: #{@name}"
    puts "Bike Price: #{@price}"
  end
end

class Bike < Vehicle
  def initialize(name, price, dealer, percent_inc)
    @dealer = dealer
    @percent_inc = percent_inc.to_f
    super(name, price)
  end

  def price_increase
    @price += (@percent_inc / 100) * @price
  end

  def to_s
    super
    puts "Bike Dealer: #{@dealer}"
    puts ''
    price_increase
    puts "After #{@percent_inc} percent hike in price:"
    puts "Bike Name: #{@name}"
    puts "Bike Price: #{@price}"
    puts "Bike Dealer: #{@dealer}"
  end
end
if ARGV.empty?
  puts 'Please provide an input'
else
  bike = Bike.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
  bike.to_s
end
