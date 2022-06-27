require "user_interface"

RSpec.describe UserInterface do
  describe "ship setup scenario" do
    it "introduces" do
      io = double(:io)
      game1 = double(:game)
      game2 = double(:game, rows: 10, cols: 10)
      interface = UserInterface.new(io, game1, game2)
      expect(io). to receive(:puts).and_return("Welcome to the game!")
      expect(io). to receive(:puts).and_return("Set up your ships first.")
    interface.intro
    end 
    it "allows the user to setup single ship" do
      io = double(:io)
      game1 = double(:game, rows: 10, cols: 10)
      game2 = double(:game, rows: 10, cols: 10)
      interface = UserInterface.new(io, game1, game2)
      expect(game1).to receive(:unplaced_ships).and_return([
        double(:ship, length: 2),
        double(:ship, length: 5),
      ])

      expect(io).to receive(:puts).with("You have these ships remaining: 2, 5")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("3\n")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(game1).to receive(:move_available?).with(2, :vertical, 3, 2).and_return(true)
      expect(io).to receive(:puts).with("OK.")
      expect(game1).to receive(:place_ship).with({
        length: 2,
        orientation: :vertical,
        row: 3,
        col: 2
      })
      expect(io).to receive(:puts).with("This is your board now:")
      allow(game1).to receive(:player_state).and_return([
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".","S",".",".",".",".",".",".",".","."],
        [".","S",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."]])

      expect(io).to receive(:puts).with([
        "..........",
        "..........",
        ".S........",
        ".S........",
        "..........",
        "..........",
        "..........",
        "..........",
        "..........",
        ".........."
      ].join("\n"))
      interface.place_ship_on_board(game1)
    end

    it "rejects invalid input when ship choice is made" do
      io = double(:io)
      game1 = double(:game, rows: 10, cols: 10)
      game2 = double(:game, rows: 10, cols: 10)
      interface = UserInterface.new(io, game1, game2)
      expect(game1).to receive(:unplaced_ships).and_return([
        double(:ship, length: 2),
        double(:ship, length: 5),
      ])

      expect(io).to receive(:puts).with("You have these ships remaining: 2, 5")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("6\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("3\n")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(game1).to receive(:move_available?).with(6, :vertical, 3, 2).and_return(false)
      expect(io).to receive(:puts).with("Invalid Input, Try Again")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("3\n")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(game1).to receive(:move_available?).with(2, :vertical, 3, 2).and_return(true)
      expect(io).to receive(:puts).with("OK.")
      expect(game1).to receive(:place_ship).with({
        length: 2,
        orientation: :vertical,
        row: 3,
        col: 2
      })
      expect(io).to receive(:puts).with("This is your board now:")
      allow(game1).to receive(:player_state).and_return([
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".","S",".",".",".",".",".",".",".","."],
        [".","S",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."]])
      expect(io).to receive(:puts).with([
        "..........",
        "..........",
        ".S........",
        ".S........",
        "..........",
        "..........",
        "..........",
        "..........",
        "..........",
        ".........."
      ].join("\n"))
      interface.place_ship_on_board(game1)
    end





    it "rejects invalid inputs when Vertical or horizontal? [vh] is prompted" do
      io = double(:io)
      game1 = double(:game, rows: 10, cols: 10)
      game2 = double(:game, rows: 10, cols: 10)
      interface = UserInterface.new(io, game1, game2)
      expect(game1).to receive(:unplaced_ships).and_return([
        double(:ship, length: 2),
        double(:ship, length: 5),
      ])
      expect(io).to receive(:puts).with("You have these ships remaining: 2, 5")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("f\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("3\n")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Invalid Input, Try Again")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("3\n")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(game1).to receive(:move_available?).with(2, :vertical, 3, 2).and_return(true)
      expect(io).to receive(:puts).with("OK.")
      expect(game1).to receive(:place_ship).with({
        length: 2,
        orientation: :vertical,
        row: 3,
        col: 2
      })
      expect(io).to receive(:puts).with("This is your board now:")
      allow(game1).to receive(:player_state).and_return([
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".","S",".",".",".",".",".",".",".","."],
        [".","S",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."]])
      expect(io).to receive(:puts).with([
        "..........",
        "..........",
        ".S........",
        ".S........",
        "..........",
        "..........",
        "..........",
        "..........",
        "..........",
        ".........."
      ].join("\n"))
      interface.place_ship_on_board(game1)
    end

    it "rejects invalid inputs when user chooses a row or column outside of the board" do
      io = double(:io)
      game1 = double(:game, rows: 10, cols: 10)
      game2 = double(:game, rows: 10, cols: 10)
      interface = UserInterface.new(io, game1, game2)
      expect(game1).to receive(:unplaced_ships).and_return([
        double(:ship, length: 2),
        double(:ship, length: 5),
      ])
      expect(io).to receive(:puts).with("You have these ships remaining: 2, 5")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("11\n")  
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(game1).to receive(:move_available?).with(2, :vertical, 11, 2).and_return(false)
      expect(io).to receive(:puts).with("Invalid Input, Try Again")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("3\n")     
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(game1).to receive(:move_available?).with(2, :vertical, 3, 2).and_return(true)
      expect(io).to receive(:puts).with("OK.")
      expect(game1).to receive(:place_ship).with({
        length: 2,
        orientation: :vertical,
        row: 3,
        col: 2
      })
      expect(io).to receive(:puts).with("This is your board now:")
      allow(game1).to receive(:player_state).and_return([
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".","S",".",".",".",".",".",".",".","."],
        [".","S",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."]])
      expect(io).to receive(:puts).with([
        "..........",
        "..........",
        ".S........",
        ".S........",
        "..........",
        "..........",
        "..........",
        "..........",
        "..........",
        ".........."
      ].join("\n"))
      interface.place_ship_on_board(game1)
    end
    
    it "run stops when all ships are placed" do
      io = double(:io)
      game1 = double(:game, rows: 10, cols: 10)
      game2 = double(:game, rows: 10, cols: 10)
      interface = UserInterface.new(io, game1, game2)
      expect(game1).to receive(:unplaced_ships).and_return([double(:ship, length: 2)])
      expect(game1).to receive(:unplaced_ships).and_return([double(:ship, length: 2)])
      expect(io).to receive(:puts).with("You have these ships remaining: 2")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("3\n")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(game1).to receive(:move_available?).with(2, :vertical, 3, 2).and_return(true)
      expect(io).to receive(:puts).with("OK.")
      expect(game1).to receive(:place_ship).with({
        length: 2,
        orientation: :vertical,
        row: 3,
        col: 2
      })
      expect(io).to receive(:puts).with("This is your board now:")
      allow(game1).to receive(:player_state).and_return([
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".","S",".",".",".",".",".",".",".","."],
        [".","S",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."]])
      expect(io).to receive(:puts).with([
        "..........",
        "..........",
        ".S........",
        ".S........",
        "..........",
        "..........",
        "..........",
        "..........",
        "..........",
        ".........."
      ].join("\n"))
      expect(game1).to receive(:unplaced_ships).and_return([])
      interface.setup_board(game1,game2)
    end  
  end

  describe "shot taking scenario" do
    it "allows the user to shoot a ship" do
      io = double(:io)
      game1 = double(:game, rows: 10, cols: 10)
      game2 = double(:game)
      user_interface = UserInterface.new(io, game1, game2)
      expect(io).to receive(:puts).with("This is your board now:")
      allow(game1).to receive(:player_state).and_return([
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".","S",".",".",".",".",".",".",".","."],
        [".","S",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."],
        [".",".",".",".",".",".",".",".",".","."]])
      expect(io).to receive(:puts).with([
        "..........",
        "..........",
        ".S........",
        ".S........",
        "..........",
        "..........",
        "..........",
        "..........",
        "..........",
        ".........."
      ].join("\n"))
      expect(io).to receive(:puts).with("Please choose position")
      expect(io).to receive(:puts).with("Select row")
      expect(io).to receive(:gets).and_return("3\n")
      expect(io).to receive(:puts).with("Select column")
      expect(io).to receive(:gets).and_return("2\n")
      expect(game1).to receive(:shot_available?).with(3,2).and_return(true)
      expect(game1).to receive(:player_ship_at?).with(3,2).and_return(true)
      expect(io). to receive(:puts).with("Hit!")
      expect(game1).to receive(:place_shot).with(3,2)
      user_interface.prompt_for_player(game1)
    end
  end

  
end
