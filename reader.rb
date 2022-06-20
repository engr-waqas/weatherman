require_relative 'weather'
require 'csv'

class Reader
  def initialize
    @data = []
  end

  def read_file(path, files)
    begin
      Dir.chdir(path) do
        Dir.glob(files).each do |file|
          result = CSV.parse(File.read(file), headers: true, converters: :numeric)
          read(result)
        end
      end
    rescue StandardError
      puts 'Directory not found! '
    end
    @data
  end

  def read(result)
    result.each do |row|
      read_row(row)
    end
  end

  def read_row(row)
    if !row['Max TemperatureC'].nil? && !row['Min TemperatureC'].nil? &&
       !row['Max Humidity'].nil? && !row[' Mean Humidity'].nil?
      @data << Weather.new(
        date: row['PKT' || 'GST'],
        max_temp: row['Max TemperatureC'],
        min_temp: row['Min TemperatureC'],
        max_humid: row['Max Humidity'],
        avg_humid: row[' Mean Humidity'])
    end
  end
end
