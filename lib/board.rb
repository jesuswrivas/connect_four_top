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
    end

    def valid_move?(integer)
        return false if !(integer - 1).between?(0,6)
        return false if @board[integer - 1].length == 6
        true
    end


    def win_check

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
            win_condition_array << @board[i]
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
        p self.last_move
    end

        

end

p1 = Player.new("p1","green")
p2 = Player.new("p2", "red")
newBoard = Board.new([[],[p1],[p2,p1],[p2,p1],[p2,p1],[p2,p2],[]], [p1,p2])
newBoard.make_move(1, p2)
newBoard.make_move(2, p1)
newBoard.update_last_move(2)

newBoard

p newBoard.win_check


