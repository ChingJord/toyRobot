# Add lib files to the front of path.
$LOAD_PATH.unshift File.expand_path('../../lib',__FILE__)

require 'toy_robot'

toy_robot = ToyRobot.new(STDOUT)
toy_robot.start

#Use chomp to cut off the '\n' character from the end
while command = gets.chomp
  toy_robot.execute_command(command)
  puts toy_robot.report
end
