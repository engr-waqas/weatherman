require_relative 'reading_files'
require_relative 'compute_data'
require_relative 'print_data'
require 'date'

begin
  # ARGV: "argument vector” a variable that contains
  # the arguments passed to a program through the
  # command line

  input_array = ARGV
  exit 0 if input_array.empty? || input_array.length != 3

  file_name = ''
    # index = files_data.index("Max TemperatureC")
  max_temp_index = 1
  low_temp_index = 3
  max_humidity_index = 7
  avg_humidity_index = 8
  compute_data_obj = ComputateData.new
  reading_files_obj = ReadingFiles.new
  print_data_obj = PrintData.new
  puts

  if input_array[0] == '-e'
    file_name = "*_#{input_array[1]}_*"
    # /home/dev/Ruby/WeatherMan/Murree_weather
    file_path = input_array[2]

    files_data = reading_files_obj.reading_files_data(file_path, file_name)

    if !files_data.empty?
      highest_temp = compute_data_obj.highest(files_data, max_temp_index)
      lowest_temp = compute_data_obj.lowest(files_data, low_temp_index)
      highest_humidity = compute_data_obj.highest(files_data, max_humidity_index)

      #Print yearly data
      print_data_obj.print_yearly_data(highest_temp, lowest_temp, highest_humidity)
    end
  end

  if input_array[0] == '-a' || input_array[0] == '-c'
    year_month = input_array[1].split '/'
    file_month = Date::ABBR_MONTHNAMES[year_month[1].to_i]
    file_year = year_month[0]
    file_name = "*_#{file_year}_#{file_month}.txt"

    files_data = reading_files_obj.reading_files_data(input_array[2], file_name)

    if !files_data.empty? && input_array[0] == '-a'
      highest_avg_temp = compute_data_obj.find_average(files_data, max_temp_index)
      lowest_avg_temp = compute_data_obj.find_average(files_data, low_temp_index)
      avg_humid = compute_data_obj.find_average(files_data, avg_humidity_index)

      #Print monthly data
      print_data_obj.print_monthly_data(highest_avg_temp, lowest_avg_temp, avg_humid)
    end

    if !files_data.empty? && (input_array[0] == '-c')
      puts "#{Date::MONTHNAMES[year_month[1].to_i]} #{file_year}"
      compute_data_obj.per_day_temp(files_data)

      puts "\n\n\n"
      puts "______Bonus Task______"
      puts "\n\n"

      puts "#{Date::MONTHNAMES[year_month[1].to_i]} #{file_year}"
      compute_data_obj.single_horizontal_line_bonus_task(files_data)
    end
  end

rescue StandardError
  puts "An error occured! "
  exit 0
end


