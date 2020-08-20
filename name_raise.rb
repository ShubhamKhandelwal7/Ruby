class ValidateNameError < StandardError
end

class Name
  BLANK_FNAME_ALERT = 'Firstname cannot be blank'.freeze
  BLANK_LNAME_ALERT = 'Lastname cannot be blank'.freeze
  CASE_FNAME_ALERT = 'Firstname must start with uppercase letter'.freeze

  def initialize(first_name, last_name)
    @first_name = first_name.to_s.strip
    @last_name = last_name.to_s.strip
  end

  def validate
    validate_blank_all
    validate_capitalize
    output_string
  end

  private

  def validate_blank_all
    validate_blank_attribute(BLANK_FNAME_ALERT, @first_name)
    validate_blank_attribute(BLANK_LNAME_ALERT, @last_name)
  end

  def validate_blank_attribute(alert, value)
    raise ValidateNameError, alert if value.empty?
  end

  def validate_capitalize
    raise ValidateNameError, CASE_FNAME_ALERT if @first_name != @first_name.capitalize
  end

  def output_string
    "Your name is #{@first_name} #{@last_name}"
  end
end

name = Name.new(ARGV[0], ARGV[1])
begin
  puts name.validate
rescue ValidateNameError => e
  puts e.message
end
