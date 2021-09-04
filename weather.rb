class Weather
  attr_accessor :max_temp, :min_temp, :max_humid, :avg_humid, :date

  def initialize(weather_args)
    @date = weather_args[:date]
    @max_temp = weather_args[:max_temp]
    @min_temp = weather_args[:min_temp]
    @max_humid = weather_args[:max_humid]
    @avg_humid = weather_args[:avg_humid]
  end
end
