require './game.rb'

module ComputerPlayer
  include GameAssets

  def ComputerPlayer.create_code
    p PEG_COLOURS.sample(4)
  end
end

ComputerPlayer.create_code()