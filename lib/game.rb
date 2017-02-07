module Reversi
	class Game
	  attr_accessor  :board
	  def initialize_board
	    @board = Array.new(8) { Array.new(8) }
	    (0..7).each do |row|
	      (0..7).each do |cell|
	        @board[row][cell]='*'
	      end
	    end
	    @board[3][3] = 'X'
	    @board[3][4] = 'O'
	    @board[4][3] = 'O'
	    @board[4][4] = 'X'
	  end

	  def check_move(row,column,option,food)
	    check_right(row,column,option,food)
	    check_north_east(row,column,option,food)
	    check_north_west(row,column,option,food)
	  end

	  def check_right(row,column,option,food)
	  	flag = false
	    if @board[row][column] == '*'

	      i=column
	      profit = 0
	      
	      while i < 7 do

	        if @board[row][i+1] == food
	          puts "sag da food var"
	          profit +=1
	          i +=1
	        end
	        break if i == 7
	        if @board[row][i] == option and profit!=0
	          flag = true
	          break
	        end
	        i +=1
	      end
	      if flag
	        while i >= column do
	          @board[row][i] = option
	          i-=1
	        end
	      end
	    end
	  end

	  def check_north_east(row,column,option,food)
	  	flag = false
	    if @board[row][column] == '*'

	      i=row
	      j=column
	      profit = 0
	      
	      while i > 0 and j < 7 do

	        if @board[i-1][j+1] == food
	          puts "üst sag da food var"
	          profit +=1
	          i -=1
	          j +=1
	        end
	        break if i == 0 or j==7
	        if @board[i][j] == option and profit!=0
	          flag = true
	          break
	        end
	        i -= 1
	        j += 1
	      end
	      if flag
	        while i <= row and j>= column do
	          @board[i][j] = option
	          i += 1
	          j -= 1
	        end
	      end
	    end
	  end

		def check_north_west(row,column,option,food)
			flag = false
		    if @board[row][column] == '*'

		      i=row
		      j=column
		      profit = 0
		      
		      while i > 0 and j > 0 do

		        if @board[i-1][j-1] == food
		          puts "üst sag da food var"
		          profit +=1
		          i -=1
		          j -=1
		        end
		        break if i == 0 or j==0
		        if @board[i][j] == option and profit!=0
		          flag = true
		          break
		        end
		        i -= 1
		        j -= 1
		      end
		      if flag
		        while i <= row and j<= column do
		          @board[i][j] = option
		          i += 1
		          j += 1
		        end
		      end
		    end
		end

	  def display_board
	      @board.each do |i|
	        puts i.each {|p| p}.join(" ")
	      end
	  end
	end
end

###### TEST CODE  ########

=begin

sağ üst çapraz kontrol

puts "-----------------"
obj.check_move(5,2,'X','O')
obj.display_board
puts "-----------------"
obj.check_move(6,1,'X','O')
obj.display_board
 sag kontrol
obj.check_move(3,2,'X','O')
obj.display_board
puts "-----------------"
obj.check_move(3,1,'X','O')
obj.display_board
=end