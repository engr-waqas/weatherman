class Computate
  require 'date'
  require 'colorize'

  #for both temperature and humidity
  def highest(data, index)
    highest_temp = -500
    highest_date = ''
    data.each do |day_wise|
      signle_day = day_wise.join.split(',')
      if signle_day[index].to_i > highest_temp.to_i && signle_day[index] != 'Max TemperatureC' && signle_day[index] != ''
        highest_temp = signle_day[index]
        highest_date = signle_day[0]
      end
    end
    date = highest_date.split '-'
    month_day = "#{Date::MONTHNAMES[date[1].to_i]} #{date[2]}"
    [highest_temp, month_day]
  end

  #for temp only
  def lowest(data, index)
    lowest_temp = 500
    lowest_date = ''
    data.each do |day_wise|
      signle_day = day_wise.join.split(',')
      if signle_day[index].to_i < lowest_temp.to_i && signle_day[index] != 'Min TemperatureC' && signle_day[index] != ''
        lowest_temp = signle_day[index]
        lowest_date = signle_day[0]
      end
    end
    date = lowest_date.split '-'
    month_day = "#{Date::MONTHNAMES[date[1].to_i]} #{date[2]}"
    [lowest_temp, month_day]
  end

  #for both temp and humidity
  def average(data, index)
    avg = 0
    data.each do |day_wise|
      signle_day = day_wise.join.split(',')
      avg += signle_day[index].to_i
    end
    avg / data.length
  end

  #Per day temp
  def per_day_temp(data)
    #Removing Headings
    data.shift(1)

    data.each do |day_wise|
      signle_day = day_wise.join.split(',')
      max_temp = ''
      low_temp = ''

      signle_day[1].to_i.times do
        max_temp += '+'.colorize(:red)
      end

      signle_day[3].to_i.times do
        low_temp += '+'.colorize(:blue)
      end

      if signle_day[1] != ''
        puts "#{format('%02d', (signle_day[0].split '-')[2].to_i)} #{max_temp} #{signle_day[1]}C"
      end

      if signle_day[3] != ''
        puts "#{format('%02d', (signle_day[0].split '-')[2].to_i)} #{low_temp} #{signle_day[3]}C"
      end
    end
  end

  #Bonus Task
  def single_horizontal_line_bonus_task(data)
    data.each do |day_wise|
      signle_day = day_wise.join.split(',')
      min_max_temp = ''

      signle_day[3].to_i.times do
        min_max_temp += '+'.colorize(:blue)
      end

      signle_day[1].to_i.times do
        min_max_temp += '+'.colorize(:red)
      end

      if signle_day[1] != '' && signle_day[3] != ''
        puts "#{format('%02d', (signle_day[0].split '-')[2].to_i)} #{min_max_temp} #{signle_day[3]}C-#{signle_day[1]}C"
      end
    end
  end
end
