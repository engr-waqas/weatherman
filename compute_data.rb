class ComputateData
  require 'date'
  require 'colorize'

  #for both temperature and humidity
  def highest(files_data, index)
    highest_temp = -500
    highest_date = ''
    files_data.each do |day_wise|
      single_day_data = day_wise.join.split(',')
      if single_day_data[index].to_i > highest_temp.to_i && single_day_data[index] != 'Max TemperatureC' && single_day_data[index] != ''
        highest_temp = single_day_data[index]
        highest_date = single_day_data[0]
      end
    end
    date_parts = highest_date.split '-'
    month_day = "#{Date::MONTHNAMES[date_parts[1].to_i]} #{date_parts[2]}"
    [highest_temp, month_day]
  end

  #for temp only
  def lowest(files_data, index)
    lowest_temp = 500
    lowest_date = ''
    files_data.each do |day_wise|
      single_day_data = day_wise.join.split(',')
      if single_day_data[index].to_i < lowest_temp.to_i && single_day_data[index] != 'Min TemperatureC' && single_day_data[index] != ''
        lowest_temp = single_day_data[index]
        lowest_date = single_day_data[0]
      end
    end
    date_parts = lowest_date.split '-'
    month_day = "#{Date::MONTHNAMES[date_parts[1].to_i]} #{date_parts[2]}"
    [lowest_temp, month_day]
  end

  #for both temp and humidity
  def find_average(files_data, index)
    avg = 0
    files_data.each do |day_wise|
      single_day_data = day_wise.join.split(',')
      avg += single_day_data[index].to_i
    end
    avg / files_data.length
  end

  #Per day temp
  def per_day_temp(files_data)
    #Removing Headings
    files_data.shift(1)

    files_data.each do |day_wise|
      single_day_data = day_wise.join.split(',')
      max_temp = ''
      low_temp = ''

      single_day_data[1].to_i.times do
        max_temp += '+'.colorize(:red)
      end

      single_day_data[3].to_i.times do
        low_temp += '+'.colorize(:blue)
      end

      if single_day_data[1] != ''
        puts "#{format('%02d', (single_day_data[0].split '-')[2].to_i)} #{max_temp} #{single_day_data[1]}C"
      end

      if single_day_data[3] != ''
        puts "#{format('%02d', (single_day_data[0].split '-')[2].to_i)} #{low_temp} #{single_day_data[3]}C"
      end
    end
  end

  #Bonus Task
  def single_horizontal_line_bonus_task(files_data)
    files_data.each do |day_wise|
      single_day_data = day_wise.join.split(',')
      min_max_temp = ''

      single_day_data[3].to_i.times do
        min_max_temp += '+'.colorize(:blue)
      end

      single_day_data[1].to_i.times do
        min_max_temp += '+'.colorize(:red)
      end

      if single_day_data[1] != '' && single_day_data[3] != ''
        puts "#{format('%02d', (single_day_data[0].split '-')[2].to_i)} #{min_max_temp} #{single_day_data[3]}C-#{single_day_data[1]}C"
      end
    end
  end

  #finding index
  def find_index(files_data, column_name)
    p column_names = files_data.shift(1).join.split(",")

  end

end
