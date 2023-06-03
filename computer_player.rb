require './game.rb'

class ComputerEncoder
  attr_reader :code

  def initialize
    @code = GameAssets::create_code
  end
  
end