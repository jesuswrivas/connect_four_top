require_relative "player.rb"

class Board

attr_accessor :board, :players, :last_move

    def initialize(board = [[],[],[],[],[],[],[]], players = [])
        @board = board
        @players = players
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


    # def win_check

    #     #Checking the columns
    #     for i in range(1..7) do
    #         return true if check_column(i)
    #     end

    #     #Checking the rows
    #     for j in range(1..6) do
    #         return true if check_row(j)
    #     endcheck_last_move
    # end


 
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
        @last_move[0] = @board[column][-1]
        @last_move[1] = [column, @board[column].length-1]
    
    end

        

end

jesus = Player.new("jesus","green")
yesi = Player.new("yesi", "red")
newBoard = Board.new([[],[],[],[],[],[],[]], [jesus,yesi])
newBoard.make_move(1, yesi)
newBoard.make_move(1, yesi)
newBoard.make_move(2, jesus)
newBoard.make_move(2, yesi)
newBoard.make_move(3, jesus)
newBoard.make_move(7, yesi)
newBoard.make_move(4, jesus)
newBoard.make_move(7, yesi)
newBoard.make_move(5, jesus)
newBoard.update_last_move(5)
p newBoard

