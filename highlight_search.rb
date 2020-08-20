class String
  def highlight_search(search_value)
    regex_value = Regexp.new(search_value, Regexp::IGNORECASE)
    count_match = 0
    updated_string = gsub(regex_value) do |item|
      count_match += 1
      '(' + item + ')'
    end
    return updated_string, count_match
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  resultant = ARGV[0].highlight_search(ARGV[1])
  modified_string = resultant[0]
  total_occurances = resultant[1]
  puts modified_string
  puts "Total occurrences found: #{total_occurances}"
end
