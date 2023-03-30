require_relative "display.rb"


class Game

    include Display

    def initialize
        clear_screen
        game_title
        style_board
        welcome_message


    end



end


newGame = Game.new