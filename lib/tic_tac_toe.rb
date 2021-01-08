require "pry"

class TicTacToe
    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS =
    [[0,1,2],
    [3,4,5], 
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2],
    [0,4,8],]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(string)
      @choice = string.to_i-1
     
    end 

    def move(input_to_index, player)
        @board[input_to_index] = player
    end
  
    def position_taken?(input_to_index)
        if @board[input_to_index] == 'O' || @board[input_to_index] == 'X'
            true
        else
            false
        end
    end

    def valid_move?(input_to_index)
        !position_taken?(input_to_index) && @board[input_to_index]
        
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
  
    def turn 
        
        choice = gets.chomp.to_i
        
        position = input_to_index(choice)
        if valid_move?(position)
            #player_token = current_player
            move(position, current_player)
            display_board
        else
            turn
        end
       
    end 

    def won? 
        WIN_COMBINATIONS.detect do |combo|
        @board[combo[0]] == @board[combo[1]]  &&
        @board[combo[1]] ==  @board[combo[2]] &&
        position_taken?(combo[0])
        end
    end

    def full? 
        @board.all? {|combo| combo == "X" || combo == "0"}
        
    end

    def draw?
        if !won? && full?
             true 
        else
             false
        end 
    end

    def over?
       if won? || draw?
           true
       else 
           false 
       end 
        
    end

    def winner
        if win = won?
            @board[win.first]
        end 
    end

    def play
        while !over?
            turn 
        end

        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
             puts "Cat's Game!"
        end
    end
    
  end 

