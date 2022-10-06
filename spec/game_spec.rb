require_relative '../lib/game'

describe Game do
    subject(:new_game) { described_class.new }
    



    describe '#winning_condition' do
    let(:winning_condition) {instance_double(win_condition)}

        describe '#checker' do
            context 'when array is (0, 1 ,2)' do                
                it 'is true' do
                    checker_true = subject.checker([1, 1, 1])
                    expect(checker_true).to be_truthy
                end
            
            context 'when array is not won'
                it 'is false' do
                    checker_false = subject.checker([1, 2 ,3])
                    expect(checker_false).to be_falsy
                end
            end

            
        end

        describe '#test_checker' do
            context 'when array == true' do
                it 'expects winning to be true' do
                    testin = subject.test_checker([1, 1, 1])
                    winning = subject.winning
                    expect(winning).to be_truthy
                end
            end

            context 'when array == false' do
                it 'expects winning to be false' do
                    testin = subject.test_checker([1, 1, 2])
                    winning = subject.winning
                    expect(winning).to be_falsy
                end
            end
        end
    end

    describe '#valid_moves' do    
        context 'if_position is free' do
            let(:valid) {subject.instance_variable_get(:@valid)}

            it 'inside range' do
                #p "valid is #{valid}"
                position = 4
                movimento = subject.valid_move?(position)
                expect(movimento).to be_truthy            
        
            end

            it 'changes @valid' do 
                position = 4                 
                expect{subject.valid_move?(position)}.to change{valid.size}.by(1)
            end

          

            it 'outside range' do
                #p "valid is #{valid}"
                position = 10
                movimento = subject.valid_move?(position)
                expect(movimento).to be_falsy            
        
            end

            it 'does not change @valid' do 
                position = 10                 
                expect{subject.valid_move?(position)}.to change{valid.size}.by(0)
            end
        end
        context 'position is ocupied' do

            let(:valid) {subject.instance_variable_get(:@valid)}

            before do
                valid << 8
            end

         
        end

        
    end

    describe 'get_move' do
        context 'valid move' do
            
        end
    end


    describe '#insert_simbol' do
    let(:board) {subject.instance_variable_get(:@board_positions)}
    let(:simbol) {'y'}
    let(:position) {7}

        context 'changing board' do
            it 'changes the vacancy to a player simbol' do
                inserir = subject.insert_simbol(simbol, position)
                expect(board[6]).to eq(simbol)
            end
        end
    end


    describe '#game_over' do
        context 'winning == true' do
            it 'returns true' do
                subject.winning = true
                expect(new_game.game_over).to be_truthy
            end
        end 
    end

    describe '#declare_winner' do
        before do
            let(:winning) {instance_variable_get(@winning)}
            let(:move) {instance_double(get_move)}

        end
        context 'jogador 1 wins' do
            
            xit 'returns jogador_1 name' do
                winning = true
                move = 5
                name1 = 'pedro'
                subject.jogador_1 = Player.new(name1, 'x')
                subject.jogador_2 = Player.new('dudu', 'o')

                expect(subject.declare_winner('x')).to receive(:puts)
            end
        end
    end
end