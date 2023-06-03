require './game.rb'

class HumanDecoder
  def initialize
    @guess_array = Array.new(4)
  end

  def decode_attempt
    puts "The available colours are: \nred, orange, yellow, blue, purple, green, white, black"
    turn_guess
    return @guess_array
  end

   def colour_guess
    colour = gets.chomp.downcase
    if GameAssets::PEG_COLOURS.any?(colour)
      return colour
    else
      puts "That is not a valid colour. Please only put valid colours."
      colour_guess
      return 
    end
   end
  
  def turn_guess
    @guess_array.each_with_index do |guess, idx|
      puts "What's colour #{idx + 1}?"
      guess_array[idx] = colour_guess 
    end
  end

  protected
  attr_accessor :guess_array
end

HumanDecoder.new.decode_attempt