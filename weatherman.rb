require_relative 'reader'
require_relative 'compute'
require_relative 'display '
require_relative 'weather'
require 'date'

class WeatherMan
  include Computate
  include Display

  def initialize
    @read = Reader.new
    @file_name = ''
  end

  def read_agruments(input_array)
    if !input_array.empty? || !input_array.length.equal?(3)
      type, date, path = input_array
      self.yearly_weather(date, path) if type.eql?('-e')
      self.monthly_weather(date, path) if type.eql?('-a')
      self.horizontal_bar_chart(date, path) if type.eql?('-c')
    end
  end

  def yearly_weather(year, path)
    file_name = "*_#{year}_*"
    result = @read.read_file(path, file_name)
    unless result.empty?
      max_temp, max_date = highest_temp(result)
      min_temp, min_date = lowest_temp(result)
      max_humid, humid_date = highest_humidity(result)
      print_yearly_weather(max_temp, max_date, min_temp, min_date, max_humid, humid_date)
    end
  end

  def monthly_weather(date, path)
    file_name = get_file_name(date)
    result = @read.read_file(path, file_name)
    unless result.empty?
      max_avg_temp, min_avg_temp, avg_humid = compute_averages(result)
      print_monthly_weather(max_avg_temp, min_avg_temp, avg_humid)
    end
  end

  def horizontal_bar_chart(date, path)
    file_name = get_file_name(date)
    result = @read.read_file(path, file_name)

    unless result.empty?
      red_line, blue_line = per_day_temp(result)
      print_per_day_temp(result, red_line, blue_line)

      blue_red_line = single_horizontal_line(result)
      print_single_horizontal_line(result, blue_red_line)
    end
  end
end

weatherman = WeatherMan.new
weatherman.read_agruments(ARGV)
