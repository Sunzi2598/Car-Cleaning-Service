class Car

  attr_reader :start_time
  attr_accessor :pickup_time, :car_time

  def initialize
    @start_time = Time.now
    @car_time = nil
    @pickup_time = nil
  end
end
