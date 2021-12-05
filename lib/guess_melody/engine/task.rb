module GuessMelody
  module Engine
    class Task
      FIRST_ANSWER_CODE = 'A'.ord

      attr_reader :sum, :question, :answers, :correct_answer

      def initialize(raw_task, sum)
        @sum = sum
        @question = raw_task['question']

        raw_answers = raw_task['answers']
        @correct_answer = raw_answers.first

        @answers = 
          raw_answers.shuffle.each_with_index.inject({}) do |answers, (answer, index)|
            answers[(FIRST_ANSWER_CODE + index).chr] = answer

            answers
          end
      end

      def correct?(answer)
        @correct_answer == answer
      end
    end
  end
end