require_relative "display.rb"
require_relative "player.rb"
require_relative "board.rb"


class Game
    
    include Display

    def initialize
        game_initialization
    end

    def create_players(board)
        player_1 = Player.new(ask_player_name(1),ask_player_color(1))
        player_2_name = ask_player_name(2)

        while player_2_name == player_1.name do
            puts "Sorry, pick a different name than Player 1"
            player_2_name = ask_player_name(2)
        end
        player_2_color = ask_player_color(2)
        while player_2_color == player_1.color do
            puts "Sorry, pick a different color than Player 1"
            player_2_color = ask_player_color(2)
        end
        player_2 = Player.new(player_2_name,player_2_color)
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
            board.show_board
            winner_message(board)
            return true
        elsif board.win_check == 0
            board.show_board
            tie_message
            return true   
        else
            return false 
        end
    end


    
    def play_again?
        answer = self.ask_play_again
        if answer == "y"
            return true
        elsif answer == "n"
            self.good_bye_message
            return false
            
        end
    end
    

end


while true
#Outer Loop - Allows player to play again

    #Creating the game
    newGame = Game.new
    newBoard = Board.new


    #We create the two players 

    newGame.create_players(newBoard)

    while true
    #Inner loop - Allows the players to make moves until someone wins
        #Player 1 makes a move
        newGame.play_round(newBoard, newBoard.players[0])
        break if newGame.game_outcomes(newBoard)

        #Player 2 makes a move
        newGame.play_round(newBoard, newBoard.players[1])
        break if newGame.game_outcomes(newBoard)
    end

    break unless newGame.play_again?

end

    
