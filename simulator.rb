require './plateau.rb'
require './rover_driver.rb'

puts "Enter Plateau coordinates:"
coordinates = gets.chomp.split(" ")
plateau = Plateau.new(coordinates[0].to_i, coordinates[1].to_i)

while true
  puts "Enter rover coordinates and direction:"
  input = gets.chomp.split(" ")
  rover_driver = RoverDriver.new(plateau, input[0].to_i, input[1].to_i, input[2].to_sym)
  moves = gets.chomp
  puts rover_driver.move(moves)
end

