require_relative "player.rb"


class Board
    
    attr_accessor :board, :players, :last_move

    def initialize(board = [[],[],[],[],[],[],[]], players = [], last_move =[])
        @board = board
        @players = players
         #"@last_move" contains the piece (player_1 for example), and [column,]
        @last_move = [[],[]]
    end

  
    def make_move(integer, player)
    #Integer needs to be between 1 and 7 (there are 7 columns). We will error check on the Display.ask_input function
        @board[integer-1] << player 
        update_last_move(integer)
    end

    def valid_move?(integer)
        return false if !(integer - 1).between?(0,6)
        return false if @board[integer - 1].length == 6
        true
    end


    def win_check
        if @board.all? { |sub_array| sub_array.empty? }
            return 1
        end
        
        #Checking the columns for @last_move
        return 2 if check_column(self.last_move[1][0])

        #Checking the rows
        return 2 if check_row(self.last_move[1][1])

        #Checking for a draw

        if self.last_move[1][1] == 6
            return 0 if check_draw
        end

        return 1

    end
   

    def contains_pattern?(array, pattern)
        array.each_cons(pattern.size).any? { |aux_array| aux_array == pattern }
    end

    
    def check_row(integer)
        #Integer ranges from 1 to 6 (indexes 0 to 5)
        win_condition_array = []
        pattern_match_player_1 = Array.new(4,@players[0])
        pattern_match_player_2 = Array.new(4,@players[1])

        for i in (0..6) do
            #This makes us check an a specific index of every column. Remember, every array in the @boards array is a column.
            win_condition_array <<  @board[i][integer-1]
        end

        if contains_pattern?(win_condition_array,pattern_match_player_1) || contains_pattern?(win_condition_array, pattern_match_player_2)
            return true
        end 

        false
    end


    def check_column(integer)
        win_condition_array = []
        pattern_match_player_1 = Array.new(4,@players[0])
        pattern_match_player_2 = Array.new(4,@players[1])
        
        for i in (0..5) do
            win_condition_array << @board[integer-1][i]
        end

        if contains_pattern?(win_condition_array,pattern_match_player_1) || contains_pattern?(win_condition_array, pattern_match_player_2)
            return true
        end 

        false

    end


    def check_draw
        draw_condition_array = []
        for i in range(0..6) do
            draw_condition_array <<  @board[i][5] unless @board[i][5].nil?
        end

        return true if draw_condition_array.length == 7

        false
    end

    def update_last_move(column)
        self.last_move[0] = self.board[column-1][-1]
        self.last_move[1] = [column, self.board[column-1].length]
    end

 
    def show_board
        puts ""
        puts ""
        puts "#{self.board[0][5] || '  '}|#{self.board[1][5] || '  '}|#{self.board[2][5] || '  '}|#{self.board[3][5] || '  '}|#{self.board[4][5] || '  '}|#{self.board[5][5] || '  '}|#{self.board[6][5] || '  '}|"
        puts "#{self.board[0][4] || '  '}|#{self.board[1][4] || '  '}|#{self.board[2][4] || '  '}|#{self.board[3][4] || '  '}|#{self.board[4][4] || '  '}|#{self.board[5][4] || '  '}|#{self.board[6][4] || '  '}|"
        puts "#{self.board[0][3] || '  '}|#{self.board[1][3] || '  '}|#{self.board[2][3] || '  '}|#{self.board[3][3] || '  '}|#{self.board[4][3] || '  '}|#{self.board[5][3] || '  '}|#{self.board[6][3] || '  '}|"
        puts "#{self.board[0][2] || '  '}|#{self.board[1][2] || '  '}|#{self.board[2][2] || '  '}|#{self.board[3][2] || '  '}|#{self.board[4][2] || '  '}|#{self.board[5][2] || '  '}|#{self.board[6][2] || '  '}|"
        puts "#{self.board[0][1] || '  '}|#{self.board[1][1] || '  '}|#{self.board[2][1] || '  '}|#{self.board[3][1] || '  '}|#{self.board[4][1] || '  '}|#{self.board[5][1] || '  '}|#{self.board[6][1] || '  '}|"
        puts "#{self.board[0][0] || '  '}|#{self.board[1][0] || '  '}|#{self.board[2][0] || '  '}|#{self.board[3][0] || '  '}|#{self.board[4][0] || '  '}|#{self.board[5][0] || '  '}|#{self.board[6][0] || '  '}|"
        puts "-" * 28
        puts " 1  2  3  4  5  6  7"
        puts ""
      end

end


# p1 = Player.new("p1","green")
# p2 = Player.new("p2", "red")

# newBoard = Board.new([[p1,p1,p1,p2],[p1,p1,p2],[p1,p2],[],[],[],[]], [p1,p2])
# newBoard.make_move(7,p2)
# newBoard.make_move(7,p2)
# newBoard.make_move(4,p1)
# p newBoard.last_move
# newBoard.show_board
# p newBoard.win_check



