class Weather
  attr_accessor :max_temp, :min_temp, :max_humid,  :avg_humid, :date

  def initialize(date, max_temp, min_temp, max_humid, avg_humid)
    @date = date
    @max_temp = max_temp
    @min_temp = min_temp
    @max_humid = max_humid
    @avg_humid = avg_humid
  end
end
