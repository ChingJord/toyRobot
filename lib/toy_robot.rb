class ToyRobot

  attr_accessor :output, :x, :y, :f, :valid_movements, :is_active, :is_valid_lastmove

  # Initialise the edges of the board with their valid movements.
  def initialize(output)
    @output = output
    @valid_movements = {
      "0,0" => {"NORTH"=>TRUE, "EAST"=>TRUE, "SOUTH"=>FALSE, "WEST"=>FALSE},
      "1,0" => {"NORTH"=>TRUE, "EAST"=>TRUE, "SOUTH"=>FALSE, "WEST"=>TRUE},
      "2,0" => {"NORTH"=>TRUE, "EAST"=>TRUE, "SOUTH"=>FALSE, "WEST"=>TRUE},
      "3,0" => {"NORTH"=>TRUE, "EAST"=>TRUE, "SOUTH"=>FALSE, "WEST"=>TRUE},
      "4,0" => {"NORTH"=>TRUE, "EAST"=>FALSE, "SOUTH"=>FALSE, "WEST"=>TRUE},
      "4,1" => {"NORTH"=>TRUE, "EAST"=>FALSE, "SOUTH"=>TRUE, "WEST"=>TRUE},
      "4,2" => {"NORTH"=>TRUE, "EAST"=>FALSE, "SOUTH"=>TRUE, "WEST"=>TRUE},
      "4,3" => {"NORTH"=>TRUE, "EAST"=>FALSE, "SOUTH"=>TRUE, "WEST"=>TRUE},
      "4,4" => {"NORTH"=>FALSE, "EAST"=>FALSE, "SOUTH"=>TRUE, "WEST"=>TRUE},
      "3,4" => {"NORTH"=>FALSE, "EAST"=>TRUE, "SOUTH"=>TRUE, "WEST"=>TRUE},
      "2,4" => {"NORTH"=>FALSE, "EAST"=>TRUE, "SOUTH"=>TRUE, "WEST"=>TRUE},
      "1,4" => {"NORTH"=>FALSE, "EAST"=>TRUE, "SOUTH"=>TRUE, "WEST"=>TRUE},
      "0,4" => {"NORTH"=>FALSE, "EAST"=>TRUE, "SOUTH"=>TRUE, "WEST"=>FALSE},
      "0,3" => {"NORTH"=>TRUE, "EAST"=>TRUE, "SOUTH"=>TRUE, "WEST"=>FALSE},
      "0,2" => {"NORTH"=>TRUE, "EAST"=>TRUE, "SOUTH"=>TRUE, "WEST"=>FALSE},
      "0,1" => {"NORTH"=>TRUE, "EAST"=>TRUE, "SOUTH"=>TRUE, "WEST"=>FALSE}
    }
  end

  def start
    puts "Welcome to ToyRobot!"
    puts "Next step - place the ToyRobot on the table using command 'PLACE,X,Y,F':"
    @is_active = true
  end

  def execute_command(commands)
    commands.split(' ').each do |command|
      if command == "PLACE"
        place(command.split(',')[1],command.split(',')[2],command.split(',')[3])
      elsif command == "MOVE"
        move
      elsif command == "LEFT"
        turn_left
      elsif  command == "RIGHT"
        turn_right
      elsif command == "REPORT"
        report
      else
        puts "Invalid command please try again"
      end
    end
  end

  # Place ToyRobot at x,y position facing f direction
  def place(x,y,f)
    if x.to_i < 5 && y.to_i < 5
      @x = x
      @y = y
      @f = f
    else
      puts "Invalid coordinates, please place ToyRobot within the 5 unit by 5 unit grid"
    end
  end


  #Check wheather a valid PLACE command has been executed on ToyRobot
  def initiate?
    is_active ? is_active : false
  end

  # Check whether next move of the ToyRobot is valid.
  # If its an edge case it will return TRUE or FALSE depending on @valid_movements.
  # If it is not an edge case it will return TRUE because any move is valid.
  def valid_move?
    unless @valid_movements["#{x},#{y}"].nil?
      coordinate = @valid_movements["#{x},#{y}"]
      return coordinate["#{f}"]
    end
    return true
  end

  # Perform 'Move' action based on the facing direction
  def move
    if valid_move?
      if @f == "NORTH"
        @y = @y.to_i + 1
      elsif f == "SOUTH"
        @y = @y.to_i - 1
      elsif f == "EAST"
        @x = @x.to_i + 1
      elsif f == "WEST"
        @x = @x.to_i - 1
      end
    end
  end

  def turn_left
    if @f == "NORTH"
      @f = "WEST"
    elsif @f == "SOUTH"
      @f = "EAST"
    elsif @f == "EAST"
      @f = "NORTH"
    elsif @f == "WEST"
      @f = "SOUTH"
    end
  end

  def turn_right
    if @f == "NORTH"
      @f= "EAST"
    elsif @f == "SOUTH"
      @f = "WEST"
    elsif @f == "EAST"
      @f = "SOUTH"
    elsif @f == "WEST"
      @f = "NORTH"
    end
  end

  def report
    (@x.nil? && @y.nil?) ?  "Invalid move ignored. Please try again" : "#{@x},#{@y},#{@f}"
  end

end
