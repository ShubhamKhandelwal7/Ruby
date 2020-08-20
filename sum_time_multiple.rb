class InvalidTimeError < StandardError
  ERROR_MESSAGE = '"Invalid 24-hour time value"'.freeze
  def initialize(msg = ERROR_MESSAGE)
    super
  end
end

require 'time'
class SumTime
  FORMAT_TIME = '%T'.freeze
  TIME_FORMAT_REGEX = /^([\d]{1,2}):([\d]{1,2}):([\d]{1,2})$/
  MAX_TIME = {
    min: 60,
    sec: 60,
    hour: 24
  }.freeze

  attr_accessor :time_stamp, :time_vars

  def initialize(*time_values)
    raise InvalidTimeError unless validate_time(*time_values)
    struct_obj = Struct.new(:total_sec, :day, :total_min,
                            :total_h, :time_stamp)
    @time_vars = struct_obj.new(0, 0, 0, 0, 0)
    time_summation
    final_time
  end

  def show_time
    if time_vars[:day] > 1
      "\"#{time_vars[:day]} days & #{time_stamp}\""
    elsif time_vars[:day] == 1
      "\"#{time_vars[:day]} day & #{time_stamp}\""
    elsif !time_stamp.nil?
      "\"#{time_stamp}\""
    end
  end

  private

  def validate_time(time)
    @validated_time = []
    time.each do |val|
      md = val.match(TIME_FORMAT_REGEX)
      if md && md[1].to_i < MAX_TIME[:hour] && md[2].to_i < MAX_TIME[:min] && md[3].to_i < MAX_TIME[:sec]
        @validated_time.push(Time.parse(val.to_s))
      else
        return false
      end
    end
  end

  def time_summation
    new_time = @validated_time.each_with_object(Hash.new(0)) do |val, res|
      res[:hour] += val.hour
      res[:min] +=  val.min
      res[:sec] +=  val.sec
      res
    end
    format_time_units(new_time)
  end

  def format_time_units(all_time)
    arr = [[:total_sec, :sec],
           [:total_min, :min],
           [:total_h, :hour]]
    arr.each do |a, b|
      time_vars[a] = (all_time[b] + time_vars[:day]).modulo(MAX_TIME[b])
      calculate_carry(all_time[b], MAX_TIME[b])
    end
  end

  def calculate_carry(total_time, default_time)
    time_vars[:day] = total_time / default_time
  end

  def final_time
    self.time_stamp = Time.parse("#{time_vars.total_h}:#{time_vars.total_min}:#{time_vars.total_sec}").strftime(FORMAT_TIME)
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts SumTime.new(ARGV).show_time
end
