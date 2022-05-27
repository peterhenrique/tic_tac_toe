# classes = game? player
require 'pry-byebug'

class Player
  attr_accessor :name, :symbol, :score

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @score = 0
  end

  def name(name); end

  def symbol(_symbol)
    @symbol
  end
end

private

class Game
  WALLS = ' - + - + -'
  attr_accessor :board_positions

  def initialize
    @board_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @valid = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    puts 'What is your name Player 1?'
    @name1 = gets.chomp
    puts "What is your symbol #{@name1}?"
    @symbol1 = gets.chomp
    puts 'What is your name Player 2?'
    @name2 = gets.chomp
    puts "What is your symbol #{@name2}?"
    @symbol2 = gets.chomp
    if @symbol1 == @symbol2
      until @symbol1 != @symbol2
        puts "Symbol invalid #{@name2}, please insert another"
        @symbol2 = gets.chomp
      end
    end

    jogador1 = Player1.new(@name1, @symbol1)
    jogador2 = Player2.new(@name2, @symbol2)

    p @name1
    p @name2
    p @symbol1
    p @symbol2
    game_start
  end

  def show_board
    puts " #{@board_positions[0]} | #{@board_positions[1]} | #{@board_positions[2]}"
    puts WALLS
    puts " #{@board_positions[3]} | #{@board_positions[4]} | #{@board_positions[5]}"
    puts WALLS
    puts " #{@board_positions[6]} | #{@board_positions[7]} | #{@board_positions[8]}"
  end

  def game_start
    @player1_turn = true
    @winning = false
    @answer = false
    @player1_score = 0
    @player2_score = 0



    show_board
    p "valid is #{@valid}"
    i = 0

    until i == 9 || @winning != false
      player_turn

      p "valid is #{@valid}"
      show_board
      if win_condition(@board_positions) == true

      end
      i += 1

    end
  end

  def win_condition(array)
    def checker(one, two, three)
      [one, two, three].uniq.length == 1
    end
    @winning_board = [
      [0, 1, 2],
      [0, 3, 6],
      [0, 4, 8],
      [3, 4, 5],
      [1, 4, 7],
      [2, 5, 8],
      [2, 4, 6]
    ]

    ## each fazer
    ## ela tem que checar se alguma das combinações estão presentes

    i = 0
    until i == @winning_board.length
      check1 = @winning_board[i][0]
      check2 = @winning_board[i][1]
      check3 = @winning_board[i][2]

      if checker(array[check1], array[check2], array[check3]) == true
        @winning = true
        if array[check1] == @symbol1
          puts "#{@name1} wins!"
        else
          puts "#{@name2} wins!"
        end

      end
      i += 1

    end
  end

  def start_new
    p 'Do you want to start a new game? (Y/N)'
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

  def player_turn
    @symbolo = []
    if @player1_turn == true
      puts "#{@name1} please select a number"
      @symbolo = @symbol1.to_s
      @position = gets.chomp.to_i
      if @valid.include?(@position) == true
        @valid.delete_at(@position - 1)
        @valid.insert(@position - 1, 'nope')
      else
        while @valid.include?(@position) == false
          puts 'Invalid position, please try again'
          @position = gets.chomp.to_i
        end
      end

      @player1_turn = false
      p @player1_turn
    else
      puts "#{@name2} please select a number"
      @symbolo = @symbol2.to_s
      @position = gets.chomp.to_i
      if @valid.include?(@position) == true
        @valid.delete_at(@position - 1)
        @valid.insert(@position - 1, 'nope')
      else
        while @valid.include?(@position) == false
          puts 'Invalid position, please try again'
          @position = gets.chomp.to_i
        end
      end
      @player1_turn = true
      p @valid

    end
    p @position
    p board_positions[@position]
    p @player1_turn

    @board_positions.delete_at(@position - 1)
    p board_positions
    @board_positions.insert(@position - 1, @symbolo)

    show_board
  end

  class Player1 < Player
  end

  class Player2 < Player
  end
end

jogo = Game.new
