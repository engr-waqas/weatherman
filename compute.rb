require 'date'
require 'colorize'

class Computate

  #Highest temperature for the year
  def highest_temp(data)
    max_temp = -9999
    date = ''
    data.each do |row|
      if row.max_temp > max_temp
        max_temp = row.max_temp
        date = row.date
      end
    end
    date = date.split '-'
    date = "#{Date::MONTHNAMES[date[1].to_i]} #{date[2]}"
    [max_temp, date]
  end

  #Lowest temperature for the year
  def lowest_temp(data)
    min_temp = 9999
    date = ''
    data.each do |row|
      if row.min_temp < min_temp
        min_temp = row.min_temp
        date = row.date
      end
    end
    date = date.split '-'
    date = "#{Date::MONTHNAMES[date[1].to_i]} #{date[2]}"
    [min_temp, date]
  end

  #Highest Humidity for the year
  def highest_humidity(data)
    max_humid = -9999
    date = ''
    data.each do |row|
      if row.max_humid > max_humid
        max_humid = row.max_humid
        date = row.date
      end
    end
    date = date.split '-'
    date = "#{Date::MONTHNAMES[date[1].to_i]} #{date[2]}"
    [max_humid, date]
  end

  #Highest average temp for a month
  def highest_average_temp(data)
    avg = 0
    data.each do |row|
      avg += row.max_temp
    end
    avg / data.length
  end

  #Lowest average temp for a month
  def lowest_average_temp(data)
    avg = 0
    data.each do |row|
      avg += row.min_temp
    end
    avg / data.length
  end

  #Average Humidity for a month
  def average_humidity(data)
    avg = 0
    data.each do |row|
      avg += row.avg_humid
    end
    avg / data.length
  end

  #Per day temp with horizontal bar charts in red and blue
  def per_day_temp(data)
    red_line = []
    blue_line = []
    data.each do |row|
      max_temp = ''
      min_temp = ''

      row.max_temp.times do
        max_temp += '+'.colorize(:red)
      end
      red_line << max_temp

      row.min_temp.times do
        min_temp += '+'.colorize(:blue)
      end
      blue_line << min_temp
    end
    [red_line, blue_line]
  end

  #Bonus Task
  def single_horizontal_line(data)
    blue_red_line = []
    data.each do |row|
      min_max_temp = ''

      row.min_temp.times do
        min_max_temp += '+'.colorize(:blue)
      end

      row.max_temp.times do
        min_max_temp += '+'.colorize(:red)
      end
      blue_red_line << min_max_temp

      # puts "#{format('%02d', (row.date.split '-')[2].to_i)} #{min_max_temp} #{row.min_temp}C-#{row.max_temp}C"
    end
    blue_red_line
  end

  #get file name by date
  def get_file_name(date)
    year, month = date.split '/'
    month = Date::ABBR_MONTHNAMES[month.to_i]
    file_name = "*_#{year}_#{month}.txt"
  end
end
