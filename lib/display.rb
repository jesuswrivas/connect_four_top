module Display



    def clear_screen
        if Gem.win_platform? # Check if the platform is Windows
          system("cls") # Clear the screen using the "cls" command for Windows
        else
          system("clear") # Clear the screen using the "clear" command for UNIX-like systems (Linux and macOS)
        end
      end

      def game_title
        puts "\n\n\n"
        puts "        _____                             _             ______               "
        puts "       /  __ \\                           | |            |  ___|              "
        puts "       | /  \\/ ___  _ __  _ __   ___  ___| |_   ______  | |_ ___  _   _ _ __ "
        puts "       | |    / _ \\| '_ \\| '_ \\ / _ \\/ __| __| |______| |  _/ _ \\| | | | '__|"
        puts "       | \\__/\\ (_) | | | | | | |  __/ (__| |_           | || (_) | |_| | |   "
        puts "        \\____/\\___/|_| |_|_| |_|\\___|\\___|\\__|          \\_| \\___/ \\__,_|_|   "
        puts "\n\n\n"
    end


    def welcome_message
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts "         The Odin Project - Ruby Route"
        puts ""
        puts "         Press any key to continue"
        puts ""

    end



    def style_board
        puts ""
        puts ""
        puts ""
        puts "            |    |    |    |    |    |"
        puts "            |    |    |    |    |    |"
        puts "            |    |    |    |    |    |"
        puts "            |    |    |    |    |    |"
        puts "            | \u{1F534} | \u{1F534} | \u{1F534} | \u{1F534} | " + "\u{1F535}" + " |"
        puts "         " + "\u{1F535}" + " | \u{1F534} | " + "\u{1F535}" + " | " + "\u{1F535}" + " | " + "\u{1F535}" + " | " + "\u{1F535}" + " |"
        puts "        ------------------------------"
        puts "           1   2   3   4   5   6   7  "
      end
      


    def game_initialization
      clear_screen
      game_title
      style_board
      welcome_message
      gets.chomp
    end
    

    def good_bye_message
        puts ""
        puts "Thank you for playing the game, see you soon!"
        puts ""
    end

    def ask_input(player, board)
        puts "#{player.name}, make your move!"
        move = gets.chomp.to_i
        until move.between?(1,7) && board.valid_move?(move) do
            show_board
            puts "Invalid move!. Try again..."
            move = gets.chomp.to_i
        end
        return move.to_i
    end



    def ask_player_name(player_number)
      puts "Player #{player_number}, whats your name? Please, type a single word"
      name = gets.chomp
      until name.match?( /\A\w+\z/ ) do
          puts "Remember to type a single word"
          name = gets.chomp
      end

      return name
      
    end


    def ask_player_color(player_number)
      colors_available = ["red", "blue", "yellow", "purple","green"]
      puts "#{player_number}, choose your color. Please, choose one of the following:"
      puts "red, blue, yellow, purple or green"
      color = gets.chomp
      until colors_available.include?(color.downcase) do
          puts "Please, pick a valid color"
          puts "red, blue, yellow, purple or green"
          color = gets.chomp
      end

      return color
      
    end



end