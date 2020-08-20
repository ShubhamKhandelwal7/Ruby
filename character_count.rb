class String
  def count_character_by_type
    @char_details = Hash.new { |hash, key| hash[key] = 0 }
    length.times do |i|
      case self[i]
      when ('0'..'9') then @char_details['digits'] += 1
      when ('a'..'z') then @char_details['lowercase'] += 1
      when ('A'..'Z') then @char_details['uppercase'] += 1
      else @char_details['special'] += 1
      end
    end
    @char_details
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  values = ARGV[0].dup.count_character_by_type
  puts "Lowercase characters = #{values['lowercase']}"
  puts "Uppercase characters = #{values['uppercase']}"
  puts "Numeric characters = #{values['digits']}"
  puts "Special characters = #{values['special']}"
end
