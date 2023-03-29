class Board
    def initialize(board = [[],[],[],[],[],[],[]], players = [])
        @board = board
        @players = players
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

end


