class Display



    def clear_screen
        if Gem.win_platform? # Check if the platform is Windows
          system("cls") # Clear the screen using the "cls" command for Windows
        else
          system("clear") # Clear the screen using the "clear" command for UNIX-like systems (Linux and macOS)
        end
      end


    def welcome_game
        clear_screen
        puts ""
        puts "Welcome to the CONNECT-FOUR"
        puts ""
        puts "The rules of the game are simple, a board game with 7 colums and 6 rowns will be shown "
        puts "The player that gets four pieces in a row wins!"
        puts ""
        puts "First, let's meet the players!"
        puts ""


    end

    def good_bye_message
        puts ""
        puts "Thank you for playing the game, see you soon!"
        puts ""
    end

    def ask_input(player)
        puts "#{player}, make your move!"
        move = gets.chomp.to_i
        until move.between?(1,7) && valid_move?(move) do
            show_board
            puts "Invalid move!. Try again..."
            move = gets.chomp.to_i
        end
        return move.to_i
    end












end