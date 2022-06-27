$LOAD_PATH << "lib"
require "game"


game = Game.new
game.place_ship(
  length: 4,
  orientation: :vertical,
  row: 0,
  col: 0
)