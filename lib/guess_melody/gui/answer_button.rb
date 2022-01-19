module MiniGL
  module Res
    class << self

      def initialize
        @prefix = File.expand_path('../../../data/', __FILE__)
        @imgs = {}
        @global_imgs = {}
        @tilesets = {}
        @global_tilesets = {}
        @sounds = {}
        @global_sounds = {}
        @songs = {}
        @global_songs = {}
        @fonts = {}
        @global_fonts = {}
        @img_dir = '/img/'
        @tileset_dir = 'tileset/'
        @sound_dir = '/sound/'
        @song_dir = 'song/'
        @font_dir = '/font/'
        @separator = '_'
        @retro_images = false
      end 
    end
  end
end

module GuessMelody
  module Gui
    class AnswerButton < MiniGL::Button
      include MiniGL

      def initialize(y, text, &action)
        super(x, y, C.font(40), text, :btn, 0xffffff, 0xa0a0a0, 0xffffff,
          0xffffff, true, true, 0, 0, 0, 0, 0, nil, 1, 1, &action)
        
        @sound = Res.sound :btn
      end

      def click
        @action.call
        @sound.play
      end

      private

      def x
        (C.screen_width / 2) - (C.answer_width / 2)
      end
    end
  end
end