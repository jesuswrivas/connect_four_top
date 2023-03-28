class Board
    def initialize(board = [[],[],[],[],[],[],[],[]], players = [])
        @board = board
        @players = players
    end

    def make_move(row, player)
        @board[row] << player
    end

end


