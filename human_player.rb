require './game.rb'

module HumanPlayer
  include GameAssets

  def HumanPlayer.guess_input
    guess_array = Array.new(4)
    puts "What's your guess for each colour?"
    guess_array.each_with_index do |colour, idx|
      puts "Colour #{idx + 1}?"
      colour_guess = gets.chomp.downcase
      guess_array[idx] = colour_guess
    end
  end
end

HumanPlayer.guess_input