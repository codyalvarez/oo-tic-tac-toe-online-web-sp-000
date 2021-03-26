class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2],
    [0,4,8]
  ]

  def display_board
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, value)
    @board[index] = value
    @board
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0, 8)
      if position_taken?(index)
        return false
      else
        return true
      end
    else
      return false
    end
  end

  def turn_count
    count = 0
    @board.each do |pos|
      count += 1 if pos == "X" || pos == "O"
    end
    count
  end

  def current_player
    tally = turn_count
    tally % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"    #ask fo input
    input = gets.strip    #get input
    index = input_to_index(input)   #translate input into index
    if valid_move?(index)   #if index is valid -
      value = current_player
      move(index, value)    #make move for index
      display_board   #show board
    else
      turn    #resetart turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |el|
      pos1 = @board[el[0]]
      pos2 = @board[el[1]]
      pos3 = @board[el[2]]
      if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
        return el
      end
    end
    return false
    end

    def full?
      @board.all? do |el|
        position_taken?(@board.index(el))
      end
    end

    def draw?
      result_won = won?
      if full? && result_won == false
        true
      else
        false
      end
    end

    def over?
      won? || draw? ? true : false
    end

    def winner
      if won?
        arr = won?
        winning = @board[arr[0]]
        return winning
      else
        return nil
      end
    end

    def play
      until over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end





  end
