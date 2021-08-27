require 'date'
require 'colorize'

class Computate

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

  def highest_average_temp(data)
    avg = 0
    data.each do |row|
      avg += row.max_temp
    end
    avg / data.length
  end

  def lowest_average_temp(data)
    avg = 0
    data.each do |row|
      avg += row.min_temp
    end
    avg / data.length
  end

  def average_humidity(data)
    avg = 0
    data.each do |row|
      avg += row.avg_humid
    end
    avg / data.length
  end

  def per_day_temp(data)
    red_line = []
    blue_line = []
    data.each do |row|
      red_line << Array.new(row.max_temp) {'+'.colorize(:red)}.join
      blue_line << Array.new(row.min_temp) {'+'.colorize(:blue)}.join
    end
    [red_line, blue_line]
  end

  def single_horizontal_line(data)
    blue_red_line = []
    red_line = ''
    blue_line = ''
    data.each do |row|
      red_line = Array.new(row.max_temp) {'+'.colorize(:red)}.join
      blue_line = Array.new(row.min_temp) {'+'.colorize(:blue)}.join
      blue_red_line << (red_line << blue_line)
    end
    blue_red_line
  end

  def get_file_name(date)
    year, month = date.split '/'
    month = Date::ABBR_MONTHNAMES[month.to_i]
    file_name = "*_#{year}_#{month}.txt"
  end

  def get_date(data)
    year, month, day = data[0].date.split('-')
    "#{Date::MONTHNAMES[month.to_i]} #{year}"
  end

  def refine_temp_date(result)
    day = result.date.split('-')[2].to_i
    max_temp = result.max_temp
    min_temp = result.min_temp
    [day, max_temp, min_temp]
  end
end
