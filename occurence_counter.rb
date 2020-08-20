class OccuranceCounter
  REGEX = /[a-z]/i
  def initialize(input_value)
    @input_value = input_value
  end

  def counting_occurances
    char_occurences = Hash.new(0)
    @input_value.scan(REGEX) { |char| char_occurences[char] += 1 }
    char_occurences
  end
end
occurance_counter = OccuranceCounter.new(ARGV[0])
if ARGV[0].nil?
  puts 'Please provide an input'
else
  puts occurance_counter.counting_occurances
end
