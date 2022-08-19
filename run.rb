$LOAD_PATH << "lib"
require "game"
require "user_interface"
class TerminalIO
  def gets
    return Kernel.gets
  end

  def puts(message)
    Kernel.puts(message)
  end
end

io = TerminalIO.new
game1 = Game.new(name: 1)
game2 = Game.new(name: 2)
user_interface = UserInterface.new(io, game1, game2)
user_interface.intro
user_interface.run


