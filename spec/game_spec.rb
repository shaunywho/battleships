require 'game'

RSpec.describe Game do

  it "returns false when position_available? is called and there is a ship already present" do
    game = Game.new
    length,orientation,row,col = 4, :vertical, 1, 1
    game.place_ship(length: length, orientation: orientation, row: row, col: col)
    expect(game.position_available?(length,orientation, row,col)).to eq false
  end 

  it "returns true when position_available? is called and there is no ship  present" do
    game = Game.new
    length,orientation,row,col = 4, :vertical, 1, 1
    expect(game.position_available?(length,orientation, row,col)).to eq true
  end 

  it "returns true when player_ship_at? is called and there is a ship already present" do
    game = Game.new
    length,orientation,row,col = 4, :vertical, 1, 1
    game.place_ship(length: length, orientation: orientation, row: row, col: col)
    expect(game.player_ship_at?(row,col)).to eq true
  end 

  it "returns false when move_available? is called and there is a ship already present" do
    game = Game.new
    length,orientation,row,col = 4, :vertical, 1, 1
    game.place_ship(length: length, orientation: orientation, row: row, col: col)
    expect(game.move_available?(length, orientation, row, col)).to eq false
  end 

  it "returns false when move_available? is called and orientation is invalid" do
    game = Game.new
    length,orientation,row,col = 4, "f", 1, 1
    game.place_ship(length: length, orientation: orientation, row: row, col: col)
    expect(game.move_available?(length, orientation, row, col)).to eq false
  end 

  it "returns false when move_available? is called and ship is unavailable" do
    game = Game.new
    length,orientation,row,col = 6, :vertical, 1, 1
    game.place_ship(length: length, orientation: orientation, row: row, col: col)
    expect(game.move_available?(length, orientation, row, col)).to eq false
  end 

  it "returns true when move_available? is called and there are available moves" do
    game = Game.new
    length,orientation,row,col = 4, :vertical, 1, 1
    expect(game.move_available?(length, orientation, row, col)).to eq true
  end 

  it "returns false when player_ship_at? is called and there is no ship  present" do
    game = Game.new
    length,orientation,row,col = 4, :vertical, 1, 1
    expect(game.player_ship_at?(row,col)).to eq false
  end 

  it "returns false when ship_available? is called and there is no ship available" do
    game = Game.new
    expect(game.ship_available?(6)).to eq false
  end 
  
  it "returns true when ship_available? is called and there is a ship available" do
    game = Game.new
    expect(game.ship_available?(5)).to eq true
  end 


  it "deletes a ship from list only when a ship doesn't exist in position" do
    game = Game.new
    game.place_ship(length: 4, orientation: :vertical, row: 1, col: 1)
    unplaced_ships_0 = game.unplaced_ships.clone
    game.place_ship(length: 4, orientation: :vertical, row: 1, col: 1)
    expect(game.unplaced_ships).to eq unplaced_ships_0
  end 

  it "returns false when row and col are outside the board" do
    game = Game.new
    expect(game.position_available?(4, :vertical, 11, 11)).to eq false
  end

  it "returns false when a part of the ship extends beyong the board" do
    game = Game.new
    expect(game.position_available?(4, :vertical, 9, 9)).to eq false
  end


  it "doesn't remove a ship from @unplaced_ships if it's an invalid input'" do
    game = Game.new
    game.place_ship(length: 4, orientation: :vertical, row: 1, col: 1)
    unplaced_ships_0 = game.unplaced_ships.clone
    game.place_ship(length: 4, orientation: :vertical, row: 1, col: 1)
    expect(game.unplaced_ships).to eq unplaced_ships_0
  end 

  it "returns true if shot_available? is called and there is an available shot" do
    game = Game.new
    expect(game.shot_available?(1,1)).to eq true
  end 

  it "returns false if shot_available? is called and the position is off the board" do
    game = Game.new
    expect(game.shot_available?(15,15)).to eq false
  end

  it "returns false if shot_available? is called and a shot has already been taken in that position" do
    game = Game.new
    game.place_shot(1,1)
    expect(game.shot_available?(1,1,)).to eq false
  end 

  # it "returns false if finished? is called and not all the ships have been shot" do
  #   game = Game.new(ships:[2])
  #   game.place_ship(length: 2,orientation: :vertical, row: 1,col: 1)
  #   game.place_shot(1,1)
  #   game.place_shot(2,1)

end 
  
