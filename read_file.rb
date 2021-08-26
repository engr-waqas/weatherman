require_relative 'weather'

DATE_INDEX = 0
MAX_TEMP_INDEX = 1
MIN_TEMP_INDEX = 3
MAX_HUMID_INDEX = 7
AVG_HUMID_INDEX = 8

class Read

  def initialize
    @data = []
  end

  def read_file(path, files)
    begin
      Dir.chdir(path) do
        Dir.glob(files).each do |file|
          File.readlines(file).each do |line|
            line = line.split('\n').join.split(',')
            if line[DATE_INDEX] != "PKT" && line[MAX_TEMP_INDEX] != ""
              date = line[DATE_INDEX]
              max_temp = line[MAX_TEMP_INDEX].to_i
              min_temp = line[MIN_TEMP_INDEX].to_i
              max_humid = line[MAX_HUMID_INDEX].to_i
              avg_humid = line[AVG_HUMID_INDEX].to_i
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
