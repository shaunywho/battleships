require 'pp'
# As a player
# So that I can prepare for the game
# I would like to place a ship in a board location

# As a player
# So that I can play a more interesting game
# I would like to have a range of ship sizes to choose from

# As a player
# So the game is more fun to play
# I would like a nice command line interface that lets me enter ship positions and
# shots using commands (rather than using IRB to interact with objects)

# As a player
# So that I can create a layout of ships to outwit my opponent
# I would like to be able to choose the directions my ships face in

# As a player
# So that I can have a coherent game
# I would like ships to be constrained to be on the board

# As a player
# So that I can have a coherent game
# I would like ships to be constrained not to overlap

# As a player
# So that I can win the game
# I would like to be able to fire at my opponent's board

# As a player
# So that I can refine my strategy
# I would like to know when I have sunk an opponent's ship

# As a player
# So that I know when to finish playing
# I would like to know when I have won or lost

# As a player
# So that I can consider my next shot
# I would like to be able to see my hits and misses so far

# As a player
# So that I can play against a human opponent
# I would like to play a two-player game

class Game
  attr_accessor :total_targets, :total_shots
  def initialize(columns: 10, rows: 10, ships: [5,4,4,3,3,3,3,3,3,3,2,2,2,2,2], name: 1)
    @name = name
    @unplaced_ships = ships.map{|length| Ship.new(length)}
    @total_targets = ships.sum
    @total_shots = 0
    @rows = rows
    @cols = columns
    @player_state = (1..@cols).map do |x|
      (1..@rows).map do |y|
        "."
      end 
    end
    @opponent_state = (1..@cols).map do |x|
      (1..@rows).map do |y|
        "."
      end 
    end
    
  end

  def unplaced_ships
    @unplaced_ships
  end

  def name 
    @name
  end 
  
  def rows
    @rows
  end

  def lost?
    if @total_targets == @total_shots
      true
    else 
      false
    end 
  end 
    

  def cols
    @cols
  end

  def player_state
    @player_state
  end 
  def opponent_state
    @opponent_state
  end 

  def player_ship_at?(y,x)
    @player_state[y-1][x-1] == "S"
  end

  def place_shot(y,x)
    if player_ship_at?(y,x)
      @total_shots += 1
      @opponent_state[y-1][x-1] = "X"
    else
      @opponent_state[y-1][x-1] = "O"
    end
      @player_state[y-1][x-1] = "X"
  end

  def shot_available?(y,x)
    (1..@cols).include?(x) && (1..@rows).include?(y) && @player_state[y-1][x-1] != "X"
  end


  def place_ship(length: 5,orientation: :vertical, row: 1, col: 1)
    if position_available?(length,orientation,row, col) && ship_available?(length)
      ship = @unplaced_ships.detect{|ship| ship.length ==length}
      case orientation
      when :vertical
        (row...row+length).each{|index| @player_state[index-1][col-1]="S"}
        @unplaced_ships.delete(ship)
      when :horizontal
        (col...col+length).each{|index| @player_state[row-1][index-1]="S"}
        @unplaced_ships.delete(ship)
      end
    end
  end 



  def position_available?(length,orientation,row,col)
    positions = []
    if orientation == :vertical
      (row...(row+length)).each{|index| positions.append([index,col])}
    elsif orientation == :horizontal
      (col...(col+length)).each{|index| positions.append([row,index])}
    else 
      return false
    end 
    position_availability = positions.map{|position| ((1..@cols).include?(position[1]) && (1..@rows).include?(position[0])) ? !player_ship_at?(position[0],position[1]) : false}
    return position_availability.all?
  end

  def ship_available?(length)
    @unplaced_ships.map{|ship| ship.length}.include?(length)
  end

  def move_available?(length,orientation,row, col)
    (position_available?(length,orientation,row,col) && ship_available?(length))
  end




end

class Ship
  def initialize(length)
    @length = length
  end
  def length
    @length
  end
end 

# game = Game.new
# game.place_ship()
# pp game.state 
