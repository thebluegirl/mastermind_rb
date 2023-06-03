require './game.rb'

class ComputerEncoder
  attr_reader :code

  def initialize
    @code = GameAssets::PEG_COLOURS.sample(4)
  end
  
end