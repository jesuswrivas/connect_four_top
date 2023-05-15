require_relative "display.rb"
require_relative "player.rb"
require_relative "board.rb"


class Game
    attr_accessor :board

    include Display

    def initialize
        game_initialization
    end


    def create_players(board)
        player_1 = Player.new(ask_player_name(1),ask_player_color(1))
        player_2 = Player.new(ask_player_name(2),ask_player_color(2))
        board.players[0] = player_1
        board.players[1] = player_2
    end

    def play_round(board, player)
        board.show_board
        player_move = ask_input(player,board)
        board.make_move(player_move, player)               
    end

    def game_outcomes(board)
        if board.win_check == 2
            winner_message(board)
            return true
        elsif board.win_check == 0
            tie_message
            return true   
        else
            return false 
        end
    end
    

end

#Creating the game

newGame = Game.new
newBoard = Board.new

#We create the two players 
newGame.create_players(newBoard)

while true
    #Player 1 makes a move
    newGame.play_round(newBoard, newBoard.players[0])
    break if newGame.game_outcomes(newBoard)

     #Player 2 makes a move
    newGame.play_round(newBoard, newBoard.players[1])
    break if newGame.game_outcomes(newBoard)

end
    newBoard.show_board