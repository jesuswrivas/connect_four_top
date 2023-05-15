require_relative "display.rb"
require_relative "player.rb"
require_relative "board.rb"


class Game
    
    attr_accessor :game_board

    include Display

    def initialize
        game_initialization
        @game_board = Board.new
        self.create_players
     
    end

    def create_players
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
        @game_board.players[0] = player_1
        @game_board.players[1] = player_2
    end

    def play_round(player)
        @game_board.show_board
        player_move = ask_input(player,@game_board)
        @game_board.make_move(player_move, player)               
    end

    def game_outcomes
        if @game_board.win_check == 2
            @game_board.show_board
            winner_message(@game_board)
            return true
        elsif @game_board.win_check == 0
            @game_board.show_board
            tie_message
            return true   
        else
            return false 
        end
    end


    
    def play_again?
        answer = self.ask_play_again
        if answer == "y"
            @game_board.reset_board
            return true
        elsif answer == "n"
            self.good_bye_message
            return false
            
        end
    end


    def full_game
        
        while true
            #Outer Loop - Allows player to play again
            puts "Outer loop here"
            
            while true
            #Inner loop - Allows the players to make moves until someone wins
                #Player 1 makes a move
                play_round(@game_board.players[0])
                break if game_outcomes
                #Player 2 makes a move
                play_round(@game_board.players[1])
                break if game_outcomes
            end
        
            break unless play_again?
            
         end

    end
    

end



    
