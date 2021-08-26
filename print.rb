class Display

  def print_max_temp(max_temp, date)
    puts "Highest: #{max_temp}C on #{date}"
  end

  def print_min_temp(min_temp, date)
    puts "Lowest: #{min_temp}C on #{date}"
  end

  def print_max_humid(max_humid, date)
    puts "Humid: #{max_humid}% on #{date}"
  end

  def print_max_avg_temp(max_avg_temp)
    puts "Highest Average: #{max_avg_temp}C"
  end

  def print_min_avg_temp(min_avg_temp)
    puts "Lowest Average: #{min_avg_temp}C"
  end

  def print_avg_humidity(avg_humid)
    puts "Average Humidity: #{avg_humid}%"
  end

  def print_per_day_temp(data, red_line, blue_line)
    data.length.times do |row|
      puts "#{format('%02d', (data[row].date.split '-')[2].to_i)} " \
        "#{red_line[row]} #{data[row].max_temp}C"
      puts "#{format('%02d', (data[row].date.split '-')[2].to_i)} "  \
        "#{blue_line[row]} #{data[row].min_temp}C"
    end
  end

  def print_single_horizontal_line(data, blue_red_line)
    puts "\n\n\n______Bonus Task______\n\n"
    data.length.times do |row|
      puts "#{format('%02d', (data[row].date.split '-')[2].to_i)} " \
        "#{blue_red_line[row]} #{data[row].min_temp}C-#{data[row].max_temp}C"
    end
  end

end
