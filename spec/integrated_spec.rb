require 'game'
require 'user_interface'
class TerminalIO
  def gets
    return Kernel.gets
  end

  def puts(message)
    Kernel.puts(message)
  end
end


RSpec.describe "Integration" do

  it "places" do
    io = TerminalIO.new
    game1 = Game.new
    game2 = Game.new
    expect(io).to receive(:puts).with("You have these ships remaining: 5, 4, 4, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2")
    expect(io).to receive(:puts).with("Which do you wish to place?")
    expect(io).to receive(:gets).and_return("5\n")
    expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
    expect(io).to receive(:gets).and_return("v\n")
    expect(io).to receive(:puts).with("Which row?")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("Which column?")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("OK.")
    expect(io).to receive(:puts).with("This is your board now:")
    expect(io).to receive(:puts).with("S.........\nS.........\nS.........\nS.........\nS.........\n..........\n..........\n..........\n..........\n..........")
    user_interface = UserInterface.new(io, game1, game2)
    user_interface.place_ship_on_board(game1)

  end 
  it "places and doesn't allow ships to overlap" do
    io = TerminalIO.new
    game1 = Game.new
    game2 = Game.new
    expect(io).to receive(:puts).with("You have these ships remaining: 5, 4, 4, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2")
    expect(io).to receive(:puts).with("Which do you wish to place?")
    expect(io).to receive(:gets).and_return("5\n")
    expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
    expect(io).to receive(:gets).and_return("v\n")
    expect(io).to receive(:puts).with("Which row?")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("Which column?")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("OK.")
    expect(io).to receive(:puts).with("This is your board now:")
    expect(io).to receive(:puts).with("S.........\nS.........\nS.........\nS.........\nS.........\n..........\n..........\n..........\n..........\n..........")
    expect(io).to receive(:puts).with("You have these ships remaining: 4, 4, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2")
    expect(io).to receive(:puts).with("Which do you wish to place?")
    expect(io).to receive(:gets).and_return("4\n")
    expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
    expect(io).to receive(:gets).and_return("v\n")
    expect(io).to receive(:puts).with("Which row?")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("Which column?")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("Invalid Input, Try Again")
    expect(io).to receive(:puts).with("Which do you wish to place?")
    expect(io).to receive(:gets).and_return("4\n")
    expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
    expect(io).to receive(:gets).and_return("v\n")
    expect(io).to receive(:puts).with("Which row?")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("Which column?")
    expect(io).to receive(:gets).and_return("2\n")
    expect(io).to receive(:puts).with("OK.")
    expect(io).to receive(:puts).with("This is your board now:")
    expect(io).to receive(:puts).with("SS........\nSS........\nSS........\nSS........\nS.........\n..........\n..........\n..........\n..........\n..........")
    user_interface = UserInterface.new(io, game1, game2)
    user_interface.place_ship_on_board(game1)
    user_interface.place_ship_on_board(game1)
  end 

  it "doesn't allow ships to be placed unless they exist" do
    io = TerminalIO.new
    game1 = Game.new
    game2 = Game.new
    expect(io).to receive(:puts).with("You have these ships remaining: 5, 4, 4, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2")
    expect(io).to receive(:puts).with("Which do you wish to place?")
    expect(io).to receive(:gets).and_return("6\n")
    expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
    expect(io).to receive(:gets).and_return("v")
    expect(io).to receive(:puts).with("Which row?")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("Which column?")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("Invalid Input, Try Again")
    expect(io).to receive(:puts).with("Which do you wish to place?")
    expect(io).to receive(:gets).and_return("5\n")
    expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
    expect(io).to receive(:gets).and_return("v\n")
    expect(io).to receive(:puts).with("Which row?")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("Which column?")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("OK.")

    expect(io).to receive(:puts).with("This is your board now:")
    expect(io).to receive(:puts).with("S.........\nS.........\nS.........\nS.........\nS.........\n..........\n..........\n..........\n..........\n..........")
    user_interface = UserInterface.new(io, game1, game2)
    user_interface.place_ship_on_board(game1)
  end 

  it "doesn't allow ships to be placed in an invalid position" do
    io = TerminalIO.new
    game1 = Game.new
    game2 = Game.new
    expect(io).to receive(:puts).with("You have these ships remaining: 5, 4, 4, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2")
    expect(io).to receive(:puts).with("Which do you wish to place?")
    expect(io).to receive(:gets).and_return("5\n")
    expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
    expect(io).to receive(:gets).and_return("v")
    expect(io).to receive(:puts).with("Which row?")
    expect(io).to receive(:gets).and_return("9")
    expect(io).to receive(:puts).with("Which column?")
    expect(io).to receive(:gets).and_return("1")
    expect(io).to receive(:puts).with("Invalid Input, Try Again")
    expect(io).to receive(:puts).with("Which do you wish to place?")
    expect(io).to receive(:gets).and_return("5\n")
    expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
    expect(io).to receive(:gets).and_return("v\n")
    expect(io).to receive(:puts).with("Which row?")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("Which column?")
    expect(io).to receive(:gets).and_return("1\n")
    expect(io).to receive(:puts).with("OK.")

    expect(io).to receive(:puts).with("This is your board now:")
    expect(io).to receive(:puts).with("S.........\nS.........\nS.........\nS.........\nS.........\n..........\n..........\n..........\n..........\n..........")
    user_interface = UserInterface.new(io, game1, game2)
    user_interface.place_ship_on_board(game1)
  end
  describe "prompt_for_player" do
    before(:each) do     
      @io = TerminalIO.new
      @game1 = Game.new(ships: [1])
      @game2 = Game.new(ships: [1])
      @user_interface = UserInterface.new(@io, @game1, @game2)
      @game1.place_ship(length: 1,orientation: :vertical, row: 1, col: 1)
      @game2.place_ship(length:1 , orientation: :vertical, row: 1, col: 1)
    end

    it "should allow the user to shoot a ship" do
      expect(@io).to receive(:puts).with("Player 1's Turn")
      expect(@io).to receive(:puts).with("This is your board now:")
      expect(@io).to receive(:puts).with("S.........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........")
      expect(@io).to receive(:puts).with("This is your opponent's board now:")
      expect(@io).to receive(:puts).with("..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........")
      expect(@io).to receive(:puts).with("Please choose position")
      expect(@io).to receive(:puts).with("Select row")
      expect(@io).to receive(:gets).and_return("1\n")
      expect(@io).to receive(:puts).with("Select column")
      expect(@io).to receive(:gets).and_return("1\n")
      expect(@io).to receive(:puts).with("Hit!")
      @user_interface.prompt_for_player(@game1,@game2)
    end

    it "should prevent the user from shooting in the same place" do
      expect(@io).to receive(:puts).with("Player 1's Turn")
      expect(@io).to receive(:puts).with("This is your board now:")
      expect(@io).to receive(:puts).with("S.........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........")
      expect(@io).to receive(:puts).with("This is your opponent's board now:")
      expect(@io).to receive(:puts).with("X.........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........")
      expect(@io).to receive(:puts).with("Please choose position")
      expect(@io).to receive(:puts).with("Select row")
      expect(@io).to receive(:gets).and_return("1\n")
      expect(@io).to receive(:puts).with("Select column")
      expect(@io).to receive(:gets).and_return("1\n")
      expect(@io).to receive(:puts).with("Invalid Input, Try Again")
      expect(@io).to receive(:puts).with("Select row")
      expect(@io).to receive(:gets).and_return("1\n")
      expect(@io).to receive(:puts).with("Select column")
      expect(@io).to receive(:gets).and_return("2\n")
      @game2.place_shot(1,1)
      @user_interface.prompt_for_player(@game1, @game2)
    end
    it "should prevent the user from shooting outside of the board" do
      expect(@io).to receive(:puts).with("Player 1's Turn")
      expect(@io).to receive(:puts).with("This is your board now:")
      expect(@io).to receive(:puts).with("S.........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........")
      expect(@io).to receive(:puts).with("This is your opponent's board now:")
      expect(@io).to receive(:puts).with("..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........")
      expect(@io).to receive(:puts).with("Please choose position")
      expect(@io).to receive(:puts).with("Select row")
      expect(@io).to receive(:gets).and_return("11\n")
      expect(@io).to receive(:puts).with("Select column")
      expect(@io).to receive(:gets).and_return("11\n")
      expect(@io).to receive(:puts).with("Invalid Input, Try Again")
      expect(@io).to receive(:puts).with("Select row")
      expect(@io).to receive(:gets).and_return("1\n")
      expect(@io).to receive(:puts).with("Select column")
      expect(@io).to receive(:gets).and_return("2\n")
      @user_interface.prompt_for_player(@game1, @game2)
    end
  end 

  describe "run" do
    before(:each) do     
      @io = TerminalIO.new
      @game1 = Game.new(ships:[1], name: 1)
      @game2 = Game.new(ships:[1], name: 2)
      @user_interface = UserInterface.new(@io, @game1, @game2)
      @game1.place_ship(length: 1,orientation: :vertical, row: 1, col: 1)
      @game2.place_ship(length: 1,orientation: :vertical, row: 2, col: 2)
    end

    it "ends when player 1 shoots down all of player 2's ships" do
      expect(@io).to receive(:puts).with("Player 1's Turn")
      expect(@io).to receive(:puts).with("This is your board now:")
      expect(@io).to receive(:puts).with("..........\n.S........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........")
      expect(@io).to receive(:puts).with("This is your opponent's board now:")
      expect(@io).to receive(:puts).with("..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........")
      expect(@io).to receive(:puts).with("Please choose position")
      expect(@io).to receive(:puts).with("Select row")
      expect(@io).to receive(:gets).and_return("1\n")
      expect(@io).to receive(:puts).with("Select column")
      expect(@io).to receive(:gets).and_return("1\n")
      expect(@io).to receive(:puts).with("Hit!")
      expect(@io).to receive(:puts).with("Player 2's Turn")
      expect(@io).to receive(:puts).with("This is your board now:")
      expect(@io).to receive(:puts).with("X.........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........")
      expect(@io).to receive(:puts).with("This is your opponent's board now:")
      expect(@io).to receive(:puts).with("..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........\n..........")
      expect(@io).to receive(:puts).with("Please choose position")
      expect(@io).to receive(:puts).with("Select row")
      expect(@io).to receive(:gets).and_return("1\n")
      expect(@io).to receive(:puts).with("Select column")
      expect(@io).to receive(:gets).and_return("1\n")
      expect(@io).to receive(:puts).with("Player 2 wins!")
      @user_interface.play(@game1, @game2)

    end 

  end


end