class Array
  def group_by_length
    sorted_collection = Hash.new { |hash, key| hash[key] = [] }
    each do |item|
      sorted_collection[item.length] << item
    end
    sorted_collection
  end
end

class Hash
  def sort_by_key
    sort.to_h
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  ARGV[0] = ARGV[0].scan(/\w+/)
  puts ARGV[0].group_by_length.sort_by_key
end
