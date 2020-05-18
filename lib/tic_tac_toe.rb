class TicTacToe

  def initialize
    @board = [" ", " "," ", " "," ", " "," ", " "," "]
  end

  def play
    # @board = Array.new(9, " ")
    # Play until someone wins or there is a draw
    turn until over?
    # Congratulate the winner
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #right column
    [0, 4, 8], #top left corner to bottom right corner
    [2, 4, 6]  #top right corner to bottom left corner
  ]

  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

  def input_to_index(user_input)
   user_input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
   if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
      return false
   else
      return true
   end
  end

  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      return true
    end
  end

  def turn_count
   counter = 0
   @board.each do |spaces|
      if spaces == "X" || spaces == "O"
         counter += 1
      end
   end
   counter
end

def current_player
   turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
   user_input = gets.strip
   index = input_to_index(user_input)
   if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
   end
end

def won?
  a = WIN_COMBINATIONS.find{
    |combo|
    @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
  }
  b = WIN_COMBINATIONS.find{
    |combo|
    @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
  }
  return a || b
end

def full?
  @board.all? {|i| i == "X" || i == "O"}
end

def draw?
  if !won? && full?
    return true
  elsif !won? && !full?
    return false
  else won?
    return false
  end
end

def over?
  if draw? || won? || full?
    return true
  end
end

def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end
end
