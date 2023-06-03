require './game.rb'

class HumanDecoder
  def initialize
    @guess_array = Array.new(4)
  end

  def decode_attempt
    puts "The available colours are: \nred, orange, yellow, blue, purple, green, white, black"
    make_guess
    return @guess_array
  end

  def make_guess
    @guess_array.each_with_index do |guess, idx|
      puts "What's colour #{idx + 1}?"
      colour = gets.chomp.downcase
      if GameAssets::PEG_COLOURS.any?(colour)
        @guess_array[idx] = colour
      else
        puts "That is not a valid colour. Please only put valid colours."
        make_guess 
        return
      end
    end
  end
end

HumanDecoder.new.decode_attempt