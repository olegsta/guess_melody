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