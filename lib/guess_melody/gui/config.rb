module GuessMelody
  module Gui
    module Config
      SCREEN_WIDTH = 1200
      SCREEN_HEIGHT = 800
      QUES_WIDTH = 800
      ANSWER_WIDTH = 400
      ANSWER_HEIGHT = 120
      FONT_FAMILY = :noto
      BG_IMAGE = "lib/data/img/bg.png"
    end

    class CReader
      include MiniGL

      def screen_width
        Config::SCREEN_WIDTH
      end
    
      def screen_height
        Config::SCREEN_HEIGHT
      end
    
      def ques_width
        Config::QUES_WIDTH
      end
    
      def answer_width
        Config::ANSWER_WIDTH
      end
    
      def answer_height
        Config::ANSWER_HEIGHT
      end
    
      def text_helper(size = 40, line_height = 5, scale_x = 1, scale_y = 1)
        TextHelper.new font(size), line_height, scale_x, scale_y
      end

      def font(size = 20)
        Res.font Config::FONT_FAMILY, size
      end

      def background
        @background_image ||= Gosu::Image.new(Config::BG_IMAGE, tileable: true)
      end
    end
  end
end