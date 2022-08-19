class UserInterface
  def initialize(io, game1,game2)
    @io = io
    @game1 = game1
    @game2 = game2
  end


  def intro
    show "Welcome to the game!"
    show "Set up your ships first."
  end 

  def place_ship_on_board(game)
    show "You have these ships remaining: #{ships_unplaced_message(game)}"
    prompt_for_ship_placement(game)
    show "This is your board now:"
    show player_board(game)
  end

  def setup_player(game)
    show "Player #{game.name}'s Turn"
    while not game.unplaced_ships.empty?
      place_ship_on_board(game)
    end
  end 

  def setup_board(game1,game2)
    setup_player(game1)
    setup_player(game2)
  end 

  def play(game1, game2)

    while !(finished?(game1,game2))
      prompt_for_player(game2,game1)
      prompt_for_player(game1,game2)
    end
    winner_message(game1, game2)
  end 

  def prompt_for_player(game1, game2)
    show "Player #{game1.name}'s Turn"
    show "This is your board now:"
    show player_board(game1)
    show "This is your opponent's board now:"
    show opponent_board(game2)
    show "Please choose position"
    y = prompt "Select row"
    x = prompt "Select column"
    while !shot_move_valid?(game2,y,x)
      show "Invalid Input, Try Again"
      y = prompt "Select row"
      x = prompt "Select column"
    end 
    if game2.player_ship_at?(y.to_i,x.to_i)
      show "Hit!"
    end 
    game2.place_shot(y.to_i,x.to_i)
  end 

  def shot_input_valid(row,col)
    # check if input is valid, x.to_i.to_s==x checks if the input string is an integer
    (row.to_i.to_s == row && col.to_i.to_s == col)
  end

  def shot_move_valid?(game,row,col)
    if shot_input_valid(row,col)
      game.shot_available?(row.to_i,col.to_i)
    else 
      false
    end
  end 


  def winner_message(game1,game2)
    if game1.lost?
      show("Player 2 wins!")
    else
      show("Player 1 wins!")
    end 
  end 

  def finished?(game1, game2)
    if game1.lost? || game2.lost?
      return true
    else 
      return false
    end 
  end 

      

  def run
    intro
    setup_board(@game1, @game2)
    play(@game1, @game2)
  end

  # private

  def show(message)
    @io.puts(message)
  end

  def prompt(message)
    @io.puts(message)
    return @io.gets.chomp
  end

  def ships_unplaced_message(game)
    return game.unplaced_ships.map do |ship|
      "#{ship.length}"
    end.join(", ")
  end

  def prompt_for_ship_placement(game)
    ship_length = prompt "Which do you wish to place?"
    ship_orientation = prompt "Vertical or horizontal? [vh]"
    ship_row = prompt "Which row?"
    ship_col = prompt "Which column?"
    while !placement_move_valid?(game, ship_length, ship_orientation, ship_row, ship_col)
      show "Invalid Input, Try Again"
      ship_length = prompt "Which do you wish to place?"
      ship_orientation = prompt "Vertical or horizontal? [vh]"
      ship_row = prompt "Which row?"
      ship_col = prompt "Which column?"
    end 
    show "OK."
    game.place_ship(
      length: ship_length.to_i,
      orientation: {"v" => :vertical, "h" => :horizontal}.fetch(ship_orientation),
      row: ship_row.to_i,
      col: ship_col.to_i)
  end

  def placement_input_valid?(length, ship_orientation,row, col)
    # check if input is valid, x.to_i.to_s==x checks if the input string is an integer
    (length.to_i.to_s == length) && (row.to_i.to_s == row) && (col.to_i.to_s == col) && ["v","h"].include?(ship_orientation)
  end

  def placement_move_valid?(game, length,ship_orientation,row,col)
    if placement_input_valid?(length,ship_orientation,row,col)
      game.move_available?(length.to_i,{"v" => :vertical, "h" => :horizontal}.fetch(ship_orientation),row.to_i,col.to_i)
    else 
      false
    end
  end 

  # def format_board(game)
  #   return (1..game.rows).map do |y|
  #     (1..game.cols).map do |x|
  #       next "S" if game.ship_at?(x, y)
  #       next "."
  #     end.join
  #   end.join("\n")
  # end


  def player_board(game)
    game.player_state.map(&:join).join("\n")
  end 

  def opponent_board(game)
    game.opponent_state.map(&:join).join("\n")
  end 
    
end
