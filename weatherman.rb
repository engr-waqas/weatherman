require_relative 'reader'
require_relative 'compute'
require_relative 'display '
require_relative 'weather'
require 'date'

class WeatherMan

  def initialize
    @display = Display.new
    @compute = Computate.new
    @read = Reader.new
    @file_name = ''
  end

  def read_agruments(input_array)
    if !input_array.empty? || input_array.length != 3
      type, date, path = input_array
      yearly_weather(date, path) if type == '-e'
      monthly_weather(date, path) if type == '-a'
      horizontal_bar_chart(date, path) if type == '-c'
    end
  end

  def yearly_weather(year, path)
    file_name = "*_#{year}_*"
    result = @read.read_file(path, file_name)
    if !result.empty?
      max_temp, max_date = @compute.highest_temp(result)
      min_temp, min_date = @compute.lowest_temp(result)
      max_humid, humid_date = @compute.highest_humidity(result)
      @display.print_yearly_weather(max_temp, max_date, min_temp, min_date, max_humid, humid_date)
    end
  end

  def monthly_weather(date, path)
    file_name = @compute.get_file_name(date)
    result = @read.read_file(path, file_name)
    if !result.empty?
      max_avg_temp = @compute.highest_average_temp(result)
      min_avg_temp = @compute.lowest_average_temp(result)
      avg_humid = @compute.average_humidity(result)
      @display.print_monthly_weather(max_avg_temp, min_avg_temp, avg_humid)
    end
  end

  def horizontal_bar_chart(date, path)
    file_name = @compute.get_file_name(date)
    result = @read.read_file(path, file_name)

    if !result.empty?
      red_line, blue_line = @compute.per_day_temp(result)
      @display.print_per_day_temp(result, red_line, blue_line)

      blue_red_line = @compute.single_horizontal_line(result)
      @display.print_single_horizontal_line(result, blue_red_line)
    end
  end
end

weatherman = WeatherMan.new
weatherman.read_agruments(ARGV)
