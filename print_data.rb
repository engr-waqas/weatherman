class PrintData

  def print_yearly_data(highest_temp, lowest_temp, highest_humidity)
    puts "Highest: #{highest_temp[0]}C on #{highest_temp[1]}"
    puts "Lowest: #{lowest_temp[0]}C on #{lowest_temp[1]}"
    puts "Humid: #{highest_humidity[0]}% on #{highest_humidity[1]}"
  end

  def print_monthly_data(highest_avg_temp, lowest_avg_temp, avg_humid)
    puts "Highest Average: #{highest_avg_temp}C"
    puts "Lowest Average: #{lowest_avg_temp}C"
    puts "Average Humidity: #{avg_humid}%"
  end

end
