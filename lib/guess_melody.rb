require_relative "guess_melody/version"
require 'ruby2d'
require 'minigl'
require_relative 'guess_melody/engine/task'
require_relative 'guess_melody/engine/game_engine'
require_relative 'guess_melody/gui/config'
require_relative 'guess_melody/gui/message'
require_relative 'guess_melody/gui/text'
require_relative 'guess_melody/gui/answer_button'
require_relative 'guess_melody/gui/main'
require_relative 'guess_melody/game'



# boom = Music.new("test.mp3")
# boom.volume = 50
# # Play the sound
# boom.play
GuessMelody::Game.new
# sleep 10
# boom = Music.new("test.mp3")
# module GuessMelody
#   class Error < StandardError; end
#     boom = Music.new("test.mp3")
#     boom.volume = 50
#     # Play the sound
#     boom.play
#     sleep 100
# end

