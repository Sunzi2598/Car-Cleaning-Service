require_relative 'car.rb'

class Service 
  
  OPEN_SERVICE = 8
  CLOSE_SERVICE = 20
  CAR_CLEANING_TIME = 120
	OPEN_SATURDAY = 10
	CLOSE_SATURDAY = 16
  
  def initialize
    @worker1 = Array.new
    @worker2 = Array.new
  end

  def pickup(car)
    if @worker1.empty?
      car.car_time = car.start_time
      calculate_pickup(car)
      @worker1.push(car)
      return
		elsif @worker2.empty?
      car.car_time = car.start_time
      calculate_pickup(car)
      @worker2.push(car)
			return
    end
      
    if @worker1.last.pickup_time < car.start_time
    	car.car_time = car.start_time
      calculate_pickup(car)
      @worker1.push(car)
			return
    end
		
    if @worker2.last.pickup_time < car.start_time
      car.car_time = car.start_time
      calculate_pickup(car)
      @worker2.push(car)
			return
    end
      
    if @worker1.last.pickup_time < @worker2.last.pickup_time
    	car.car_time = @worker1.last.pickup_time 
      calculate_pickup(car)
      @worker1.push(car)
			return
    else
      car.car_time = @worker2.last.pickup_time
      calculate_pickup(car)
      @worker2.push(car)
		end
	end
    
  def calculate_pickup(car)
		pickup = car.car_time
    pickup += CAR_CLEANING_TIME * 60
		if pickup.saturday?
			
			if pickup.hour < CLOSE_SATURDAY || pickup.hour == CLOSE_SATURDAY && pickup.min == 0
		      car.pickup_time = pickup
		  else
		      #monday
		      pickup += 24 * 3600
		      pickup += 16 * 3600
		      car.pickup_time = pickup
		  end

		else
			
				if pickup.hour < CLOSE_SERVICE || pickup.hour == CLOSE_SERVICE && pickup.min == 0
    			#today
      		car.pickup_time = pickup
				else 
					
					#next day is saturday
					if (pickup + 24 * 3600).saturday?
        		pickup += 14 * 3600
        		car.pickup_time = pickup
      		else 
						#next day is not saturday
      			pickup += 12 * 3600
      			car.pickup_time = pickup
					end
				end
		end
  end
		
  def add_car
  	new_car = Car.new
    pickup(new_car)
    new_car.pickup_time.strftime("%A %d-%m-%Y %H:%M")
  end
end
