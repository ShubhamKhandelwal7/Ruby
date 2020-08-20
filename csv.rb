require 'CSV'
class CsvReader
  def initialize(filename)
    @filename = filename
    read_file
  end

  def read_file
    CSV.foreach(@filename, headers: true) do |row|
      Employee.new(row)
    end
  end
end

class Employee
  attr_accessor :emp_name, :emp_id, :designation

  def initialize(details)
    @emp_name = details['Name'].strip
    @emp_id = details[' EmpId'].strip
    @designation = details[' Designation'].strip
  end

  def self.store_in_collection
    @output = Hash.new { |hash, key| hash[key] = [] }
    ObjectSpace.each_object(Employee).to_a.each  do |obj|
      @output[obj.designation].push([obj.emp_name, "( EmpId:#{obj.emp_id} )"])
    end
  end

  def self.sort_details
    sort_by_designation
    sort_by_id
  end

  def self.sort_by_designation
    @output = @output.sort.to_h
  end

  def self.sort_by_id
    @output = @output.each do |_designatn, details|
      details.sort_by! { |_name, id| id }
    end
  end

  def self.to_csv
    store_in_collection
    sort_details
    File.open('out.txt', 'w') do |file|
      @output.each do |key, value|
        if value.length > 1
          file.puts "#{key.strip}s"
        else
          file.puts key.strip
        end
        value.each { |item| file.print item[0], item[1] }
        file.puts ''
      end
    end
  end
end

CsvReader.new(ARGV[0])
Employee.to_csv
puts File.read('out.txt')
