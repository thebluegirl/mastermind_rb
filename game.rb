require './computer_player.rb'
require './human_player.rb'

class Game
  def gameplay_type
    puts "Welcome to mastermind! Would you like to be the encoder or the decoder?"
    gameplay = gets.chomp.downcase
  
    if gameplay == "e" || gameplay_type == "encoder"
      ComputerCode.new.human_guesser
    elsif gameplay == "d" || gameplay_type == "decoder"
      
    else
      puts "Please put in a valid option."
      gameplay_type
      return
    end
  end
end

class ComputerCode
  def initialize
    @decode_board = Array.new(10)
    @computer = ComputerEncoder.new
    @human = HumanDecoder.new
  end

  def human_guesser
    @decode_board.each_with_index do |turn, idx|
      puts "This is turn #{idx + 1}. You have #{9 - idx} attempts left"
      turn = @human.decode_attempt

      if turn == @computer.code
        puts "You cracked the code!"
        return
      else
        feedback_arr = Array.new
        turn.each_with_index do |colour_guess, index|
          feedback_number = compare(colour_guess, index)
          feedback_arr << feedback_number
        end
        feedback_arr.sort.reverse.each { |num| print num.to_s }
        print "\n"
      end
    end
  end

  def compare(guess, idx)
    if guess == @computer.code[idx]
      return 2
    elsif @computer.code.any?(guess)
      return 1
    else
      return 0
    end
  end

  protected
  attr_accessor :decode_board
end

game = ComputerCode.new
game.human_guesser