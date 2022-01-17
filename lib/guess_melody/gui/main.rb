module GuessMelody
  module Gui
    class Main < MiniGL::GameWindow
      include MiniGL

      def initialize(engine)
        super C.screen_width, C.screen_height, false
        self.caption = "Guess Melody"
        @engine = engine
        show_next_task
      end

      def needs_cursor?
        true
      end

      def update
        Mouse.update
        @btns.map(&:update)
      end

      def draw
        C.background.draw(0, 0, 0)
        @message&.write
        @btns.map(&:draw)
      end

      def button_down(id)
        close and return if id == Gosu::KB_ESCAPE

        super
      end

      private

      def clear_answers
        @btns = []
      end

      def show_next_task(prev_task = nil, answer = nil)
        clear_answers

        return show_loss(prev_task) if prev_task && !prev_task.correct?(answer)
        return show_win if @engine.player_won?

        next_task = @engine.next_task
        Thread.new do
          show_answers next_task
          show_question next_task
        end
      end

      def show_win
        @message = Message.new "Вы победили! " +
          "Ваш выигрыш: #{@engine.current_prize}"
      end

      def show_loss(task)
        @message = Message.new "К сожалению, вы ошиблись. " +
          "Правильный ответ: #{task.correct_answer}. " +
          "Ваш выигрыш: #{@engine.current_prize} УЕ."
      end

      def show_question(task)
        @message = Message.new "Вопрос #{@engine.current_step + 1} / " +
          "#{@engine.total_steps}. Сумма #{task.sum}"
          song = Music.new("lib/data/sound/#{task.question}.mp3")
          song.volume = 50
          # Play the sound
          song.play
          sleep 20
          song.stop
      end

      def show_answers(task)
        task.answers.each_with_index.
          inject(150) do |current_y_coord, ((char, answer), index)|
          answer_y = current_y_coord + 20
          answer_y = index.zero? ? answer_y : (answer_y + C.answer_height)
          @btns << AnswerButton.new(answer_y, "#{char}. #{answer}") do
            show_next_task task, answer
          end

          answer_y
        end
      end
    end
  end
end