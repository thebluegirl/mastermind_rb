require './computer_player.rb'

module GameAssets
  PEG_COLOURS = 
    ["red", "yellow", "orange", "blue", "purple", "green", "white", "black"]

end

class Game
  attr_accessor :decode_board
  def initialize
    @decode_board = Array.new(10)
  end

  code = ComputerEncoder.new.code
end