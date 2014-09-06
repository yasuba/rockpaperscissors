require 'game' 

describe Game do 
	let(:player1) {double :player1, name: "Stephen"}
	let(:player2) {double :player2, name: "Enrique"}
	let(:game){Game.new(player1, player2)}

	it "has two players" do
		expect(game.players).to eq [player1, player2]
	end

	context 'when playing' do

		it 'player one picks rock, player two picks scissors' do
			allow(player1).to receive(:pick).and_return("Rock")
			allow(player2).to receive(:pick).and_return("Scissors")
			expect(game.winner).to eq player1
			expect(game.victory).to eq "crushes"
		end

		it 'player one picks paper, player two picks scissors' do
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Scissors")
			expect(game.winner).to eq player2
			expect(game.victory).to eq "cuts"
		end

		it "player one picks paper, player two picks rock" do
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Rock")
			expect(game.winner).to eq player1
		end

		it "can be a draw" do
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Paper")
			expect(game.winner).to eq "Draw"
		end

		it 'player one picks ninja, player two picks scissor' do
			allow(player1).to receive(:pick).and_return("Ninja")
			allow(player2).to receive(:pick).and_return("Scissors")
			expect(game.winner).to eq player2
		end

		it 'player one picks ninja, player two picks rock' do
			allow(player1).to receive(:pick).and_return("Ninja")
			allow(player2).to receive(:pick).and_return("Rock")
			expect(game.winner).to eq player2
		end

		it 'player one picks ninja, player two picks paper' do
			allow(player1).to receive(:pick).and_return("Ninja")
			allow(player2).to receive(:pick).and_return("Paper")
			expect(game.winner).to eq player1
		end

		it 'player one picks ninja, player two picks samurai' do
			allow(player1).to receive(:pick).and_return("Ninja")
			allow(player2).to receive(:pick).and_return("Samurai")
			expect(game.winner).to eq player1
		end

		it 'player one picks samurai, player two picks rock' do
			allow(player1).to receive(:pick).and_return("Samurai")
			allow(player2).to receive(:pick).and_return("Rock")
			expect(game.winner).to eq player1
		end

		it 'player one picks samurai, player two picks scissors' do
			allow(player1).to receive(:pick).and_return("Samurai")
			allow(player2).to receive(:pick).and_return("Scissors")
			expect(game.winner).to eq player1
		end

		it 'player one picks samurai, player two picks paper' do
			allow(player1).to receive(:pick).and_return("Samurai")
			allow(player2).to receive(:pick).and_return("Paper")
			expect(game.winner).to eq player2
		end

	end

end