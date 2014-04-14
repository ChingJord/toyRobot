require 'toy_robot'
describe 'Toy Robot' do
  describe 'start game' do
    let(:toy_robot) {ToyRobot.new(STDOUT)}
    it 'should place Toy Robot on x=0 y=0 facing NORTH on the table' do
      initiate_game
      toy_robot.x.should == 0
      toy_robot.y.should == 0
      toy_robot.f.should == 'NORTH'
    end

    it 'should discard all commands in the sequence until a valid PLACE' do
      toy_robot.move
      toy_robot.turn_right
      toy_robot.should_not be_initiate
      initiate_game
      toy_robot.should be_initiate
    end

    it 'should move one unit forward to the NORTH direction when move is called after an initial place' do
      initiate_game
      toy_robot.move
      toy_robot.x.should == 0
      toy_robot.y.should == 1
      toy_robot.f.should == 'NORTH'
    end

    it 'should move one unit forward to the SOUTH direction when move is called after an initial place ,with right' do
      initiate_game
      toy_robot.place(1,1,'NORTH')
      toy_robot.turn_left
      toy_robot.x.should == 1
      toy_robot.y.should == 1
      toy_robot.f.should == 'WEST'
    end

    it 'should output the x,y,direction when report is called' do
      initiate_game
      toy_robot.place(1,1,'NORTH')
      toy_robot.report.should == "1,1,NORTH"
    end

    it 'should ignore any move that would cause the robot to fall' do
      initiate_game
      toy_robot.turn_right
      toy_robot.move
      toy_robot.report.should == '1,0,EAST'
    end

    it 'initiate game with PLACE command followed by a forward move' do
      toy_robot.start
      toy_robot.place(1,1,'NORTH')
      toy_robot.move
      toy_robot.report.should == '1,2,NORTH'

    end
  end
end

#Helper method for initiating the game
def initiate_game
  toy_robot.start
  toy_robot.place(0,0,'NORTH')
end