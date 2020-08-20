class Product
  attr_accessor :name, :is_imported, :is_exempted, :price, :total

  def initialize(prod_name = '', is_imported = 0, is_exempted = 0, price = 0)
    @name = prod_name
    @is_imported = is_imported
    @is_exempted = is_exempted
    @price = price
    @total = price_update
  end

  def to_s
    "Name of Product: #{name.capitalize}\n"\
    "Is it Imported: #{is_imported}\n"\
    "Is it Exempted: #{is_exempted}\n"\
    "Price(with tax): #{total.round(2)}\n"
  end

  private

  def price_update
    total = price
    total *= 1.10 if is_exempted
    total *= 1.05 if is_imported
    total
  end
end

class ProductManager
  attr_reader :attr_messages, :product_list

  def initialize
    @product_list = []
    @attr_messages = { name: 'Name of the product:', is_imported: 'Imported?:',
                       is_exempted: 'Exempted from sales tax?', price: 'Price:',
                       cont: 'Do you want to add more items to list(y/n):' }
  end

  def user_input
    cont = true
    while cont
      puts attr_messages[:name]
      name = gets.strip
      puts attr_messages[:is_imported]
      is_imported = gets.strip.casecmp?('yes')
      puts attr_messages[:is_exempted]
      is_exempted = gets.strip.casecmp?('yes')
      puts attr_messages[:price]
      price = gets.strip.to_f
      add_products(name, is_imported, is_exempted, price)
      puts attr_messages[:cont]
      cont = gets.strip.casecmp?('yes')
    end
  end

  def add_products(name, is_imported, is_exempted, price)
    @product_list << Product.new(name, is_imported, is_exempted, price)
  end

  def display_product_list
    product_list.each { |product| puts product }
    puts "Grand Total: #{compute_total.round}"
  end

  private

  def compute_total
    return @grand_total unless @grand_total.nil?
    @grand_total = product_list.inject(0) do |res, cur|
      res + cur.total
    end
  end
end

manager = ProductManager.new
manager.user_input
manager.display_product_list
