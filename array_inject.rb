class Array
  def group_by_type
    order_length.inject(Hash.new { |hash, key| hash[key] = [] }) do |res, item|
      res['even'] << item[1] if item[0].even?
      res['odd'] << item[1] if item[0].odd?
      res
    end
  end

  private

  def order_length
    inject(Hash.new { |hash, key| hash[key] = [] }) do |result, item|
      result[item.length] << item
      result
    end
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts ARGV[0].scan(/\w+/).group_by_type
end
