class Car

  attr_reader :start_time
  attr_accessor :pickup_time, :car_time

  def initialize()
    @start_time = Time.now
    #time when we start to wash your car
    @car_time = nil
    @pickup_time = nil
  end
end

class Service 
    OPEN_SERVICE = 8
    CLOSE_SERVICE = 20
    CAR_CLEANING_TIME = 2
    def initialize()
      @worker1 = Array.new
      @worker2 = Array.new
    end

    def pickup(car)
      #when both are free
      if @worker1.empty?
        car.car_time = car.start_time
        pickup = car.car_time
        pickup += CAR_CLEANING_TIME * 60 * 60
        if pickup.hour < CLOSE_SERVICE || pickup.hour == CLOSE_SERVICE && pickup.min == 0
          #today
          car.pickup_time = pickup
        else
          #next day
            pickup += 12 * 60 * 60
            car.pickup_time = pickup
          end
        @worker1.push(car)
        return
      elsif @worker2.empty?
        car.car_time = car.start_time
        pickup = car.car_time
        pickup += CAR_CLEANING_TIME * 60 * 60
        if pickup.hour < CLOSE_SERVICE || pickup.hour == CLOSE_SERVICE && pickup.min == 0
          #today
          car.pickup_time = pickup
        else
          #next day
            pickup += 12 * 60 * 60
            car.pickup_time = pickup
        end
        @worker2.push(car)
        return
      end
      
      #when a worker is busy
      if @worker1.last.pickup_time < car.start_time
        car.car_time = car.start_time
        pickup = car.car_time
        pickup += CAR_CLEANING_TIME * 60 * 60
        if pickup.hour < CLOSE_SERVICE || pickup.hour == CLOSE_SERVICE && pickup.min == 0
          #today
          car.pickup_time = pickup
        else
          #next day
            pickup += 12 * 60 * 60
            car.pickup_time = pickup
        end
        @worker1.push(car)
        return
      end
      if @worker2.last.pickup_time < car.start_time
        car.car_time = car.start_time
        pickup = car.car_time
        pickup += CAR_CLEANING_TIME * 60 * 60
        if pickup.hour < CLOSE_SERVICE || pickup.hour == CLOSE_SERVICE && pickup.min == 0
          #today
          car.pickup_time = pickup
        else
          #next day
            pickup += 12 * 60 * 60
            car.pickup_time = pickup
        end
        @worker2.push(car)
        return
      end
      
      #when both are busy
      if @worker1.last.pickup_time < @worker2.last.pickup_time
        car.car_time = @worker1.last.pickup_time 
        pickup = car.car_time
        pickup += CAR_CLEANING_TIME * 60 * 60
        if pickup.hour < CLOSE_SERVICE || pickup.hour == CLOSE_SERVICE && pickup.min == 0
          #today
          car.pickup_time = pickup
        else
          #next day
            pickup += 12 * 60 * 60
            car.pickup_time = pickup
        end
        @worker1.push(car)
        return
      else
        car.car_time = @worker2.last.pickup_time
        pickup = car.car_time
        pickup += CAR_CLEANING_TIME * 60 * 60
        if pickup.hour < CLOSE_SERVICE || pickup.hour == CLOSE_SERVICE && pickup.min == 0
          #today
          car.pickup_time = pickup
        else
          #next day
            pickup += 12 * 60 * 60
            car.pickup_time = pickup
        end
        @worker2.push(car)
      end
    end
      
      #when we add a car we want to set the pickup time and to print it
      def add_car
        new_car = Car.new
        pickup(new_car)
        new_car.pickup_time.strftime("%A %d-%m-%Y %H:%M")
      end

end


serivce = Service.new

puts "Menu:"
puts "Type 'add' if you want to add a car"
puts "Type 'exit' if you want to exit.\n"
command = gets.chomp

until command === "exit"
  case command
  when "add"
    puts serivce.add_car()
  else 
    puts "Type your command again.\n"
  end
  command = gets.chomp
end


