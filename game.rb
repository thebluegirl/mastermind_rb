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
    @decode_board.each_with_index do |turn, idx|
      puts "This is turn #{idx + 1}. You have #{10 - idx} attempts left"
      turn = @human.decode_attempt

      if turn == @computer.code
        puts "You cracked the code!"
        return
      else
        puts "No... That's not it..."
      end
    end
  end

end

game = Game.new
game.human_guesser