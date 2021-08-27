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
          self.read(result)
        end
      end
    rescue
      puts "Directory not found! "
    end
    @data
  end

  def read(result)
    result.each do |row|
      self.read_row(row)
    end
  end

  def read_row(row)
    if !row["Max TemperatureC"].nil? && !row["Min TemperatureC"].nil? &&
       !row["Max Humidity"].nil? && !row[" Mean Humidity"].nil?
      date = row["PKT" || "GST"]
      max_temp = row["Max TemperatureC"]
      min_temp = row["Min TemperatureC"]
      max_humid = row["Max Humidity"]
      avg_humid = row[" Mean Humidity"]
      @data << Weather.new(date, max_temp, min_temp, max_humid, avg_humid)
    end
  end
end
