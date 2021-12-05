module GuessMelody
  C = Gui::CReader.new

  class Game
    def initialize
      engine = Engine::GameEngine.new
      @main_window = Gui::Main.new engine
      @main_window.show
    end
  end
end