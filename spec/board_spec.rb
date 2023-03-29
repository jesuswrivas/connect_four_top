require_relative "../lib/board.rb"


describe Board do

subject(:board){Board.new}
let(:player_1){instance_double("Player", name: "jesus", mark: "green")}

    describe "#make_move" do
        context "When making a first move on column 1" do
            #The default board, is empty
            it "Places the piece on the first slot of column 0" do
                board.make_move(1,player_1)
            #When accesing to the instance variable, we need to be careful with the indexes. In this case even thought we are referring to "column 1"
            #Remember that in the instance variable @board, column 1 has an index of 0 and column 7 (the last one) has an index of 6
                expect(board.instance_variable_get("@board")[0].length).to eq(1)
            end    
        end
        context "When making a second move on column 0" do    
            before do
                #column 0 now has one piece,
                board.make_move(1, player_1)
            end
            it "Places the second piece on the second slot of column 0" do
                board.make_move(1,player_1)
                expect(board.instance_variable_get("@board")[0].length).to eq(2)
            end
        end
    end

    describe "#valid_move?" do
    subject(:board){Board.new([[],[player_1, player_1,player_1, player_1],[],[],[player_1,player_1],[],[player_1, player_1,player_1, player_1,player_1, player_1]])}
        
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


end