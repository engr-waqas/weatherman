require_relative 'read_file'
require_relative 'compute'
require_relative 'display_weather'
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
      bar_chart(date, path) if type == '-c'
    end
  end

  def yearly_weather(year, path)
    file_name = "*_#{year}_*"
    result = @read.read_file(path, file_name)

    if !result.empty?
      max_temp, date = @compute.highest_temp(result)
      @display.print_max_temp(max_temp, date)

      min_temp, date = @compute.lowest_temp(result)
      @display.print_min_temp(min_temp, date)

      max_humid, date = @compute.highest_humidity(result)
      @display.print_max_humid(max_humid, date)
    end
  end

  def monthly_weather(date, path)
    file_name = @compute.get_file_name(date)
    result = @read.read_file(path, file_name)

    if !result.empty?
      max_avg_temp = @compute.highest_average_temp(result)
      @display.print_max_avg_temp(max_avg_temp)

      min_avg_temp = @compute.lowest_average_temp(result)
      @display.print_min_avg_temp(min_avg_temp)

      avg_humid = @compute.average_humidity(result)
      @display.print_avg_humidity(avg_humid)
    end
  end

  def bar_chart(date, path)
    file_name = @compute.get_file_name(date)
    result = @read.read_file(path, file_name)

    if !result.empty?
      red_line, blue_line = @compute.per_day_temp(result)
      self.horizontal_bar(result, red_line, blue_line)

      blue_red_line = @compute.single_horizontal_line(result)
      self.combine_horizontal_bar(result, blue_red_line)
    end
  end

  def horizontal_bar(data, red_line, blue_line)
    date = @compute.get_date(data)
    @display.print_date(date)
    data.length.times do |row|
      red_bar = red_line[row]
      blue_bar = blue_line[row]
      day, max_temp, min_temp = @compute.bar_result(data[row])
      @display.print_red_bar(day, red_bar, max_temp)
      @display.print_blue_bar(day, blue_bar, min_temp)
    end
  end

  def combine_horizontal_bar(data, blue_red_line)
    @display.print_bonus()
    date = @compute.get_date(data)
    @display.print_date(date)
    data.length.times do |row|
      bar = blue_red_line[row]
      day, max_temp, min_temp = @compute.bar_result(data[row])
      @display.print_blue_red_bar(day, bar, min_temp, max_temp)
    end
  end
end

weatherman = WeatherMan.new
weatherman.read_agruments(ARGV)
