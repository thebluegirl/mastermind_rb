require './computer_player.rb'
require './human_player.rb'

class Game
  def gameplay_type
    puts "Welcome to mastermind! Would you like to be the encoder or the decoder?"
    gameplay = gets.chomp.downcase
  
    if gameplay == "e" || gameplay == "encoder"
      HumanCoder.new.decode_attempt
    elsif gameplay == "d" || gameplay == "decoder"
      ComputerCoder.new.human_guesser
    else
      puts "That is not a valid option. Please put in a valid option."
      gameplay_type
      return
    end
  end
end

class ComputerCoder
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
        puts "You won! You cracked the code!"
        return
      else
        feedback_arr = Array.new
        turn.each_with_index do |colour_guess, index|
          feedback_number = compare(colour_guess, index)
          feedback_arr << feedback_number
        end
        feedback_arr.sort.reverse.each { |num| print num.to_s }
        print "\n"
        puts " "
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

class HumanCoder
  attr_accessor :decode_board, :initial_guess, :computer_winner
  attr_reader :code

  def initialize
    @human_player = HumanEncoder.new
    @computer_player = ComputerDecoder.new
    @decode_board = Array.new(10)
    @code = @human_player.create_code
    @initial_guess = @computer_player.initial_code_guess
    @computer_winner = false
  end

  def print_guess(array)
    array.each { |colour| print "#{colour} " }
    print "\n"
  end

  def guess_change
    @initial_guess.each_with_index do |guess, idx|
      if guess == @code[idx]
        next
      else
        guess = unique_colour
        @initial_guess[idx] = guess
      end
    end
    return @initial_guess
  end

  def unique_colour
    new_colour = GameAssets::PEG_COLOURS.sample
    if @initial_guess.any?(new_colour)
      new_colour = unique_colour
    else
      return new_colour
    end
  end

  def guess_check
    @initial_guess == @code ? true : false
  end

  def decode_attempt
    until @decode_board.last != nil
      @decode_board.each_with_index do |slot, index|
        puts "Computer attempt #{index + 1} of #{@decode_board.count}"
        print_guess(@initial_guess)
        @decode_board[index] = @initial_guess

        if guess_check
          puts "Your code has been decoded! You lose :("
          @computer_winner = true
          return
        else
          guess_change
        end
      end

      if !@computer_winner
        puts "The computer failed to decode your secret code! You win!!!"
      end

    end
  end

end

game = Game.new
game.gameplay_type