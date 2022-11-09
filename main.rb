#Tic-Tac-Toe

$gameover = false #Interruptor que indica si alguien ya ha ganado

class Game
  attr_accessor :symbol_1, :symbol_2, :player1, :player2, :current_player
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @current_player = nil
    @board = Board.new
  end
  def start
    @player1.get_name
    @player1.choose
    @symbol_1 = @player1.symbol
    @player2.get_name_2
    @player2.choose
    @symbol_2 = @player2.symbol
    @current_player = @player1
    @winner = nil
    puts "Game is about to start!"
    while $gameover==false
      turn
      change_player
      @board.check
    end
    @board.display
    check_winner
  end
  def turn
    loop do
      @board.display
      puts "It's #{@current_player.name}'s turn"
      puts "Please pick a box to play (1-9)"
      move = gets.chomp.to_i
      if move == 1
        @board.c1 = @current_player.symbol
        break
      elsif move == 2
        @board.c2 = @current_player.symbol
        break
      elsif move == 3
        @board.c3 = @current_player.symbol
        break
      elsif move == 4
        @board.c4 = @current_player.symbol
        break
      elsif move == 5
        @board.c5 = @current_player.symbol   
        break
      elsif move == 6
        @board.c6 = @current_player.symbol
        break
      elsif move == 7
        @board.c7 = @current_player.symbol
        break
      elsif move == 8
        @board.c8 = @current_player.symbol
        break
      elsif move == 9
        @board.c9 = @current_player.symbol
        break
      else
        puts "Invalid input, try again"
      end
    end
      
  end
  def change_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
  def check_winner
    if @board.winning_symbol == @player1.symbol
      @winner = @player1
      puts "#{@winner.name} is the Winner!"
    elsif @board.winning_symbol == @player2.symbol
      @winner = @player2
      puts "#{@winner.name} is the Winner!"
    elsif @board.winning_symbol == "draw"
      puts "It's a Draw!"
    end      
  end
end

class Player
  attr_accessor :name, :symbol
  def get_name
    puts "Please insert player 1 name:"
    @name = gets.chomp
  end
  def get_name_2
    puts "Please insert player 2 name:"
    @name = gets.chomp  
  end
  def choose
    puts "Plase choose a symbol to play in the board"
    @symbol = gets.chomp
  end
end

class Board
  attr_accessor :c1, :c2, :c3, :c4, :c5, :c6, :c7, :c8, :c9, :winning_symbol
  @winning_sybol = nil
  def initialize
    @c1 = " "
    @c2 = " "
    @c3 = " "
    @c4 = " "
    @c5 = " "
    @c6 = " "
    @c7 = " "
    @c8 = " "
    @c9 = " "
  end


  def check
    elements = [@c1,@c2,@c3,@c4,@c5,@c6,@c6,@c7,@c8,@c9]
    combinations = [
      [@c1,@c2,@c3],
      [@c4,@c5,@c6],
      [@c7,@c8,@c9],
      [@c1,@c4,@c7],
      [@c2,@c5,@c8],
      [@c3,@c6,@c9],
      [@c1,@c5,@c9],
      [@c3,@c5,@c7]
    ]
    if elements.include?(" ")
      combinations.each do |line|
        if all_equal?(line)
          if line[0] != " "
            @winning_symbol = line[0]
            $gameover = true
          end
        end
      end
    else
      combinations.each do |line|
        if all_equal?(line)
          @winning_symbol = line[0]
          $gameover = true
        else 
          @winning_symbol = "draw"
          $gameover = true          
        end
      end
    end
  end
  def all_equal?(array)
    if array.uniq.count <= 1
      return true
    else
      false
    end
  end
  def display
    puts "
     #{@c1} | #{@c2} | #{@c3} 
     #{@c4} | #{@c5} | #{@c6} 
     #{@c7} | #{@c8} | #{@c9} "
  end
end

new_game = Game.new()
new_game.start
