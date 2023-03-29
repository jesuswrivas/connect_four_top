require_relative "../lib/board.rb"


describe Board do

subject(:board){Board.new}
let(:p1){instance_double("Player", name: "jesus", color: "green")}
let(:p2){instance_double("Player", name: "yesi", color: "red")}

    describe "#make_move" do
        context "When making a first move on column 1" do
            #The default board, is empty
            it "Places the piece on the first slot of column 0" do
                board.make_move(1,p1)
            #When accesing to the instance variable, we need to be careful with the indexes. In this case even thought we are referring to "column 1"
            #Remember that in the instance variable @board, column 1 has an index of 0 and column 7 (the last one) has an index of 6
                expect(board.instance_variable_get("@board")[0].length).to eq(1)
            end    
        end
        context "When making a second move on column 0" do    
            before do
                #column 0 now has one piece,
                board.make_move(1, p1)
            end
            it "Places the second piece on the second slot of column 0" do
                board.make_move(1,p1)
                expect(board.instance_variable_get("@board")[0].length).to eq(2)
            end
        end
    end

    describe "#valid_move?" do
    subject(:board){Board.new([[],[p1, p1,p1, p1],[],[],[p1,p1],[],[p1, p1,p1, p1,p1, p1]])}
        
        #In the board consists of 7 columns, each column has a slot for a chip (up to 6 slots)
        context "When the column selected is column 5 (2 chips)" do
            it "returns true" do
                expect(board.valid_move?(5)).to eq(true)
            end
        end
        context "When the column selected is column 2 (4 chips)" do
            it "returns true" do
                expect(board.valid_move?(2)).to eq(true)
            end
        end
        context "When the column selected is column 7 (6 chips)" do
            it "returns false" do
                expect(board.valid_move?(7)).to eq(false)
            end
            
        end
        context "When the column selected is column 10" do
            #We perform error check on another function, which makes sure that the integer provided is between 1 and 7
            #However we test it anyways,
            it "returns false" do
                expect(board.valid_move?(10)).to eq(false)
            end    
        end
    end


    describe "#win_check" do
       

        #The win_check function checks if a player won (returns 2), if the game still on (returns 1) or if its a draw (returns 0)
            
            
            context "When there is a winning condition: Chips 2 to 5 in row 2 " do
                subject(:board){Board.new([[],[p1,p1],[p2,p1],[p2,p1],[p2,p1],[p2,p2],[]])}
                
                it "returns 2" do
                    allow(board).to receive(:check_column).with(2).and_return(false)
                    allow(board).to receive(:check_row).with(2).and_return(true)
                    board.update_last_move(2)
                    expect(board.win_check).to eq(2)             
                end
            end

            context "When there is a winning condition: Chips 1 to 4 in row 6"  do
                subject(:board){Board.new([[p2,p2,p1,p2,p2,p1],[p2,p2,p1,p2,p2,p1],[p2,p2,p1,p2,p2,p1],[p1,p1,p2,p1,p1,p1],[p2,p1],[p2,p2],[]])}
                it "returns 2" do
                    allow(board).to receive(:check_column).with(4).and_return(false)
                    allow(board).to receive(:check_row).with(6).and_return(true)
                    board.update_last_move(4)
                    expect(board.win_check).to eq(2)      
                    
                end
            end
            context "When there is no winning condition." do
                subject(:board){Board.new([[],[p1],[],[],[],[],[]])}
                it "returns 1" do
                    allow(board).to receive(:check_column).with(2).and_return(false)
                    allow(board).to receive(:check_row).with(1).and_return(false)
                    board.update_last_move(2)
                    expect(board.win_check).to eq(1)
                end
                
            end
            context "When there is no winning condition. Board full"do
            subject(:board){Board.new([[p2,p2,p1,p2,p2,p1],[p2,p2,p1,p2,p2,p1],[p2,p2,p1,p2,p2,p1],[p1,p1,p2,p1,p1,p2],[p1,p1,p2,p1,p1,p2],[p1,p1,p2,p1,p1,p2],[p2,p2,p1,p2,p2,p1]])}
              
                it "returns 0" do
                    allow(board).to receive(:check_column).with(7).and_return(false)
                    allow(board).to receive(:check_row).with(6).and_return(false)
                    allow(board).to receive(:check_draw).and_return(true)

                    board.update_last_move(7)
                    expect(board.win_check).to eq(0)
                    
                   
                end    
            end
        end



end