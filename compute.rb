require 'date'
require 'colorize'

module Computate
  def highest_temp(data)
    max_record = data.max_by(&:max_temp)
    max_temp = max_record.max_temp
    day, month, year = max_record.date.split '-'
    date = "#{Date::MONTHNAMES[month.to_i]} #{year}"
    [max_temp, date]
  end

  def lowest_temp(data)
    min_record = data.min_by(&:min_temp)
    min_temp = min_record.min_temp
    day, month, year = min_record.date.split '-'
    date = "#{Date::MONTHNAMES[month.to_i]} #{year}"
    [min_temp, date]
  end

  def highest_humidity(data)
    max_record = data.max_by(&:max_humid)
    max_humid = max_record.max_humid
    day, month, year = max_record.date.split '-'
    date = "#{Date::MONTHNAMES[month.to_i]} #{year}"
    [max_humid, date]
  end

  def compute_averages(data)
    max_avg_tem = data.map(&:max_temp).sum / data.count
    min_avg_tem = data.map(&:min_temp).sum / data.count
    avg_humid = data.map(&:avg_humid).sum / data.count
    [max_avg_tem, min_avg_tem, avg_humid]
  end

  def per_day_temp(data)
    red_line = []
    blue_line = []
    data.each do |row|
      red_line << Array.new(row.max_temp) { '+'.colorize(:red) }.join
      blue_line << Array.new(row.min_temp) { '+'.colorize(:blue) }.join
    end
    [red_line, blue_line]
  end

  def single_horizontal_line(data)
    blue_red_line = []
    red_line = ''
    blue_line = ''
    data.each do |row|
      red_line = Array.new(row.max_temp) { '+'.colorize(:red) }.join
      blue_line = Array.new(row.min_temp) { '+'.colorize(:blue) }.join
      blue_red_line << (blue_line << red_line)
    end
    blue_red_line
  end

  def get_file_name(date)
    year, month = date.split '/'
    month = Date::ABBR_MONTHNAMES[month.to_i]
    file_name = "*_#{year}_#{month}.txt"
  end

  def refine_temp_date(result)
    day = result.date.split('-')[2].to_i
    max_temp = result.max_temp
    min_temp = result.min_temp
    [day, max_temp, min_temp]
  end
end
