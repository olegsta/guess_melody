module GuessMelody
  module Gui
    class Message
      def initialize(text)
        @text = text
      end

      def write
        Text.write_breaking @text, question_x, 20, C.ques_width, :center
      end

      private

      def question_x
        @question_x ||= C.screen_width / 2
      end
    end
  end
end