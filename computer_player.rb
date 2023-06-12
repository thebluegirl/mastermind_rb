require './assets.rb'

class ComputerEncoder
  attr_reader :code

  def initialize
    @code = GameAssets::PEG_COLOURS.sample(4)
  end
  
end

class ComputerDecoder
  def initialize
    @guess_array = Array.new
  end

  def initial_code_guess
    @guess_array = GameAssets::PEG_COLOURS.sample(4)
  end
end