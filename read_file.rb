require_relative 'weather'
require 'csv'

class Read

  def initialize
    @data = []
  end

  def read_file(path, files)
    begin
      Dir.chdir(path) do
        Dir.glob(files).each do |file|
          result = CSV.parse(File.read(file), headers: true, converters: :numeric)
          result.each do |row|
            if !row["Max TemperatureC"].nil?
              date = row[0]
              max_temp = row["Max TemperatureC"]
              min_temp = row["Min TemperatureC"]
              max_humid = row["Max Humidity"]
              avg_humid = row[" Mean Humidity"]
              @data << Weather.new(date, max_temp, min_temp, max_humid, avg_humid)
            end
          end
        end
      end
    rescue
      puts "Directory not found! "
    end
    @data
  end
end
