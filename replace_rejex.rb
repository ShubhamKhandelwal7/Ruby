class String
  def alter_vowels_string
    gsub(/[aeiou]/i, '*')
  end
end

if ARGV[0].nil?
  puts 'Please provide an input'
else
  puts ARGV[0].alter_vowels_string
end
