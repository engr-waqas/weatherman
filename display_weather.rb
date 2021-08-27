require_relative 'compute'

class Display

  def initialize
    @compute = Computate.new
  end

  def print_max_temp(max_temp, date)
    puts "\nHighest: #{max_temp}C on #{date}"
  end

  def print_min_temp(min_temp, date)
    puts "Lowest: #{min_temp}C on #{date}"
  end

  def print_max_humid(max_humid, date)
    puts "Humid: #{max_humid}% on #{date}"
  end

  def print_max_avg_temp(max_avg_temp)
    puts "\nHighest Average: #{max_avg_temp}C"
  end

  def print_min_avg_temp(min_avg_temp)
    puts "Lowest Average: #{min_avg_temp}C"
  end

  def print_avg_humidity(avg_humid)
    puts "Average Humidity: #{avg_humid}%"
  end

  def print_red_bar(day, red_bar, max_temp)
    puts "#{format('%02d', day)} #{red_bar} #{max_temp}C"
  end

  def print_blue_bar(day, blue_bar, min_temp)
    puts "#{format('%02d', day)} #{blue_bar} #{min_temp}C"
  end

  def print_blue_red_bar(day, bar, min_temp, max_temp)
    puts "#{format('%02d', day)} #{bar} #{min_temp}C-#{max_temp}C"
  end

  def print_date(date)
    puts "\n" << date
  end

  def print_bonus()
    puts "\n\n\n______Bonus Task______\n\n\n"
  end

end
