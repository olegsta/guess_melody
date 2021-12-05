require 'yaml'

module GuessMelody
  module Engine
    class GameEngine
      attr_reader :current_step, :total_steps

      def initialize
        @current_step = -1
        tasks_data = YAML.load tasks_file
        @sums = tasks_data.keys.sort
        @total_steps = @sums.length
        load_tasks_from tasks_data
      end

      def next_task
        @current_step += 1

        current_sum = @sums[@current_step]
        @tasks[current_sum].sample
      end

      def player_won?
        @current_step == @total_steps - 1
      end

      def current_prize
        return 0 if @current_step < 1
        return @sums[@current_step] if player_won?
        
        @sums[@current_step - 1]
      end

      private

      def load_tasks_from(raw_data)
        @tasks = {}

        raw_data.each do |sum, raw_tasks|
          @tasks[sum] ||= []

          raw_tasks.each do |raw_task|
            @tasks[sum] << Task.new(raw_task, sum)
          end
        end
      end

      def tasks_file
        File.read File.expand_path('../../../data/tasks.yml', __FILE__)
      end
    end
  end
end