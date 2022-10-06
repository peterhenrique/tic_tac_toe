# classes = game? player
require 'pry-byebug'

class Player
  attr_accessor :name, :symbol, :score, :print_name

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @score = 0
  end

  def print_name
    puts self.name.to_s
  end
end

class Game
  WALLS = ' - + - + -'
  attr_accessor :board_positions, :winning_board, :winning, :valid, :jogador_1, :jogador_2

  def initialize(board_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @board_positions = board_positions
    @valid = []
    @winning_board = [
      [0, 1, 2],
      [0, 3, 6],
      [0, 4, 8],
      [3, 4, 5],
      [1, 4, 7],
      [2, 5, 8],
      [2, 4, 6],
      [6, 7, 8]
    ]
    @winning = false

    @jogador_1 = create_routine
    @jogador_2 = create_routine

    play_round until game_over
  end

  def game_over
    return true if @valid.size == 9
    return true if @winning == true
    false
  end

  def create_routine
    name = get_name
    simbol = get_symbol
    create_player(name, simbol)
  end

  def create_player(name, simbol)
    Player.new(name, simbol)
  end


  def get_name
    puts 'what is your name?'
    name = gets.chomp
  end

  def get_symbol
    puts 'what is your symbol?'
    simbol = gets.chomp
  end

  def show_board
    puts " #{@board_positions[0]} | #{@board_positions[1]} | #{@board_positions[2]}"
    puts WALLS
    puts " #{@board_positions[3]} | #{@board_positions[4]} | #{@board_positions[5]}"
    puts WALLS
    puts " #{@board_positions[6]} | #{@board_positions[7]} | #{@board_positions[8]}"
  end  

  def declare_winner(simbol)
    return puts "#{@jogador_1.name} wins!" if simbol == @jogador_1.symbol

    puts "#{@jogador_1.name} wins!"    
  end

  def checker(array)
    array.uniq.size == 1 ? true : false    
  end

  def test_checker(array)
    checker(array) == true ? @winning = true : false
  end


  def win_condition(array)    
    i = 0
    until i == @winning_board.length
      check1 = @winning_board[i][0]
      check2 = @winning_board[i][1]
      check3 = @winning_board[i][2]
      test_checker([array[check1], array[check2], array[check3]])
      break if winning == true
      i += 1

    end
  end

  def start_new
    puts 'Do you want to start a new game? (Y/N)'
    if gets.chomp.downcase == 'y'
      @answer = true
      jogo_ = Game.new
    elsif gets.chomp.downcase == 'n'
      @answer = true
      puts 'thank you for playing'
    else
      until @answer == true
        p 'invalid response'
        gets.chomp.downcase
      end
    end
  end

  def valid_move?(position)
    return puts 'invalid move, please try again' if position < 1 or position > 9
    return puts 'invalid move, please try again' if @valid.include?(position)

    @valid << position
    true        
  end

  def get_move
    puts 'whats your move?'
    answer = gets.chomp.to_i
    valid_move?(answer) == true ? answer : get_move
  end

  def insert_simbol(simbol, position)
    @board_positions[position-1] = simbol
  end

  def player_turn(simbol)
    return declare_winner(simbol) if game_over == true

    move = get_move
    insert_simbol(simbol, move)
    declare_winner(simbol) if game_over == true
  end

  def play_round
    show_board
    player_turn(@jogador_1.symbol)
    win_condition(@board_positions)
    show_board
    player_turn(@jogador_2.symbol)
    win_condition(@board_positions) 
  end  
end

jogo = Game.new

