require_relative 'Service.rb'

service = Service.new

puts "Menu:"
puts "Type 'add' if you want to add a car"
puts "Type 'exit' if you want to exit.\n"
command = gets.chomp

until command == "exit"
	case command
  when "add"
    puts service.add_car()
  else 
    puts "Type your command again.\n"
  end
  command = gets.chomp
end