require_relative 'read_file'
require_relative 'compute'
require_relative 'print'
require 'date'

MAX_TEMP_INDEX = 1
MIN_TEMP_INDEX = 3
MAX_HUMIDITY_INDEX = 7
AVG_HUMIDITY_INDEX = 8

begin
  input_array = ARGV
  return if input_array.empty? || input_array.length != 3

  file_name = ''

  compute = Computate.new
  read = Read.new
  display = Display.new
  puts

  if input_array[0] == '-e'
    file_name = "*_#{input_array[1]}_*"
    path = input_array[2]

    result = read.read_file(path, file_name)

    if !result.empty?
      highest_temp = compute.highest(result, MAX_TEMP_INDEX)
      lowest_temp = compute.lowest(result, MIN_TEMP_INDEX)
      highest_humidity = compute.highest(result, MAX_HUMIDITY_INDEX)

      #Print yearly data
      display.print_yearly(highest_temp, lowest_temp, highest_humidity)
    end
  end

  if input_array[0] == '-a' || input_array[0] == '-c'
    year_month = input_array[1].split '/'
    month = Date::ABBR_MONTHNAMES[year_month[1].to_i]
    year = year_month[0]
    file_name = "*_#{year}_#{month}.txt"

    result = read.read_file(input_array[2], file_name)

    if !result.empty? && input_array[0] == '-a'
      highest_avg_temp = compute.average(result, MAX_TEMP_INDEX)
      lowest_avg_temp = compute.average(result, MIN_TEMP_INDEX)
      avg_humid = compute.average(result, AVG_HUMIDITY_INDEX)

      #Print monthly data
      display.print_monthly(highest_avg_temp, lowest_avg_temp, avg_humid)
    end

    if !result.empty? && (input_array[0] == '-c')
      puts "#{Date::MONTHNAMES[year_month[1].to_i]} #{year}"
      compute.per_day_temp(result)

      puts "\n\n\n"
      puts "______Bonus Task______"
      puts "\n\n"

      puts "#{Date::MONTHNAMES[year_month[1].to_i]} #{year}"
      compute.single_horizontal_line_bonus_task(result)
    end
  end
end


