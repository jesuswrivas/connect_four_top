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
1
    def play_round(board, player)
        board.show_board
        player_move = ask_input(player,board)
        board.make_move(player_move, player)               
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
    break if newBoard.win_check == 2
 
    #Player 2 makes a move
    newGame.play_round(newBoard, newBoard.players[1])
    break if newBoard.win_check == 2
end
    newBoard.show_board