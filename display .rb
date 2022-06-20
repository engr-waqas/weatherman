require_relative 'compute'

module Display
  include Computate

  def print_yearly_weather(max_temp, max_date, min_temp, min_date, max_humid, humid_date)
    puts "\nHighest: #{max_temp}C on #{max_date} \nLowest: #{min_temp}C"\
    " on #{min_date} \nHumid: #{max_humid}% on #{humid_date}"
  end

  def print_monthly_weather(max_avg_temp, min_avg_temp, avg_humid)
    puts "\nHighest Average: #{max_avg_temp}C \nLowest Average:"\
    " #{min_avg_temp}C\nAverage Humidity: #{avg_humid}%"
  end

  def print_per_day_temp(data, date, red_line, blue_line)
    year, month = date.split('/')
    month = Date::MONTHNAMES[month.to_i]
    puts "#{month} #{year}"
    data.length.times do |row|
      day, max_temp, min_temp = refine_temp_date(data[row])
      puts "#{format('%02d', day)} #{red_line[row]} #{max_temp}C"
      puts "#{format('%02d', day)} #{blue_line[row]} #{min_temp}C"
    end
  end

  def print_single_horizontal_line(data, date, blue_red_line)
    year, month = date.split('/')
    month = Date::MONTHNAMES[month.to_i]
    puts "#{month} #{year}"
    data.length.times do |row|
      bar = blue_red_line[row]
      day, max_temp, min_temp = refine_temp_date(data[row])
      puts "#{format('%02d', day)} #{bar} #{min_temp}C-#{max_temp}C"
    end
  end
end
