require './assets.rb'

class HumanDecoder
  def initialize
    @guess_array = Array.new(4)
  end

  def decode_attempt
    puts "The available colours are:"
    GameAssets::PEG_COLOURS.each { |colour| print "#{colour} " }
    print "\n"
    turn_guess
    return @guess_array
  end

   def colour_guess
    colour = gets.chomp.downcase
    
    unless GameAssets::PEG_COLOURS.any?(colour)
      puts "That is not a valid colour. Please put in a valid colour option"
      colour = colour_guess
    end
    return colour
   end
  
  def turn_guess
    @guess_array.each_with_index do |guess, idx|
      puts "What's colour #{idx + 1}?"
      guess_array[idx] = colour_guess 
    end

    print "\n"
    puts "Your guess this turn is:"
    @guess_array.each { |colour| print "#{colour} " }
    print "\n"
  end

  protected
  attr_accessor :guess_array
end


class HumanEncoder
  attr_accessor :code_array

  def initialize
    @code_array = Array.new(4)
  end

  def intro
    puts "Please create a code of four unique colours"
    puts "The available colours are:"
    GameAssets::PEG_COLOURS.each { |colour| print "#{colour} " }
    print "\n"
  end

  def create_code
    intro
    @code_array.each_with_index do |code, idx|
      puts "What is colour #{idx + 1}?"
      @code_array[idx] = colour_code
    end
    puts "Your code is:"
    @code_array.each { |colour| print "#{colour} " }
    print "\n"
    puts " "
    return @code_array
  end

  def colour_code
    colour = gets.chomp.downcase

    if GameAssets::PEG_COLOURS.any?(colour)
      return colour
    else
      puts "That is not a valid colour. Please only put valid colours."
      colour_code
      return
    end
  end

end
