require_relative "../lib/board.rb"


describe Board do

subject(:board){Board.new}
let(:player_1){instance_double("Player", name: "jesus", mark: "green")}

    describe "#make_move" do
        context "When making a first move on row 0" do
            #The default board, is empty
            it "Places the piece on the first slot of row 0" do
                board.make_move(0,player_1)
                expect(board.instance_variable_get("@board")[0].length).to eq(1)
            end    
        end
        context "When making a second move on row 0" do    
            before do
                #Row 0 now has one piece,
                board.make_move(0, player_1)
              end
            it "Places the second piece on the second slot of row 0" do
                board.make_move(0,player_1)
                expect(board.instance_variable_get("@board")[0].length).to eq(2)
            end
        end
    end
end