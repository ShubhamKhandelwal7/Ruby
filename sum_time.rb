require 'time'
# Sum Time
class SumTime
  FORMAT_TIME = '%T'.freeze
  FORMAT_SEC = '%S'.freeze
  FORMAT_MIN = '%M'.freeze
  FORMAT_HOUR = '%H'.freeze
  ERROR_MESSAGE = '"Invalid 24-hour time value"'.freeze
  DEFAULT_TIME = {
    min: 60,
    sec: 60,
    hour: 24
  }.freeze

  def initialize(time_values)
    @day = 0
    validate_time(time_values)
    time_summation
    @time_stamp = Time.parse(final_time).strftime(FORMAT_TIME)
  end

  def show_time
    if @day > 1
      "\"#{@day} days & #{@time_stamp}\""
    elsif @day == 1
      "\"#{@day} day & #{@time_stamp}\""
    elsif !@time_stamp.nil?
      "\"#{@time_stamp}\""
    end
  end

  def validate_time(time)
    @validated_time = []
    time.each do |val|
      @validated_time.push(Time.parse(val.to_s))
    end
  end

  def time_summation
    @new_time = @validated_time.each_with_object(Hash.new(0)) do |val, res|
      res[:hour] += val.strftime(FORMAT_HOUR).to_i
      res[:min] += val.strftime(FORMAT_MIN).to_i
      res[:sec] += val.strftime(FORMAT_SEC).to_i
      res
    end
    format_time_units
  end

  def format_time_units
    arr = [:sec, :min, :hour]
    arr.each do |time|
      curr_val = @new_time[time]
      @new_time[time] = (@new_time[time] + @day).modulo(DEFAULT_TIME[time])
      calculate_carry(curr_val, DEFAULT_TIME[time])
    end
  end

  def calculate_carry(total_time, default_time)
    @day = total_time / default_time
  end

  def final_time
    "#{@new_time[:hour]}:#{@new_time[:min]}:#{@new_time[:sec]}"
  end

  private :validate_time, :time_summation, :format_time_units, :final_time
end

if ARGV.empty?
  puts 'Please provide an input'
else
  begin
    sum_time = SumTime.new(ARGV)
    puts sum_time.show_time
  rescue ArgumentError
    puts SumTime::ERROR_MESSAGE
  end
end
