require './computer_player.rb'
require './human_player.rb'

class Game
  attr_accessor :decode_board
  def initialize
    @decode_board = Array.new(10)
    @computer = ComputerEncoder.new
    @human = HumanDecoder.new
  end

  def human_guesser
    @decode_board.each_with_index do |variable|
      
    end
  end

end