require "colored"

module Reversi
	class Game
	  attr_accessor  :board
	  def initialize_board
	    @board = Array.new(8) { Array.new(8) { '*' } }
	    
	    @board[3][3] = 'X'
	    @board[3][4] = 'O'
	    @board[4][3] = 'O'
	    @board[4][4] = 'X'
	  end

	  def check_move(row,column,option,food)
		coor_right = check_right(row,column,option,food)
		move_right(coor_right, row ,column, option) if coor_right
	   

		coor_ne = check_north_east(row,column,option,food)
		move_ne(coor_ne,row,column,option) if coor_ne


	    coor_nw = check_north_west(row,column,option,food)
	    move_nw(coor_nw,row,column,option) if coor_nw

	    coor_left = check_left(row,column,option,food)
	    move_left(coor_left, row ,column, option) if coor_left

	    coor_up = check_up(row,column,option,food)
	    move_up(coor_up, row ,column, option) if coor_up

	    coor_down = check_down(row,column,option,food)
	    move_down(coor_down, row ,column, option) if coor_down

	    coor_sw = check_south_west(row,column,option,food)
	    move_sw(coor_sw, row ,column, option) if coor_sw	    

	    coor_se = check_south_east(row,column,option,food)
	    move_se(coor_se, row ,column, option) if coor_se
	  end

	  def move_up(coor,row,column,option)
	  	
	  	i = coor[:x]
	  	j = coor[:y]
	  	while i <= row
	  		@board[i][j] = option
	  		i +=1
	  	end

	  end

	  def move_down(coor,row,column,option)
	  	
	  	i = coor[:x]
	  	j = coor[:y]
	  	while i >= row
	  		@board[i][j] = option
	  		i -=1
	  	end

	  end

	  def move_ne(coor,row,column,option)
	  	

	  	i = coor[:x]
	  	j = coor[:y]
	  	while i <= row and j >= column
	  		@board[i][j] = option
	  		i +=1
	  		j -=1
	  	end
	  end

	  def move_nw(coor, row,column,option)
	  	

	  	i = coor[:x]
	  	j = coor[:y]
	  	while i <= row and j <= column
	  		@board[i][j] = option
	  		i +=1
	  		j +=1
	  	end
	  end
	  def move_sw(coor, row,column,option)
	  	

	  	i = coor[:x]
	  	j = coor[:y]
	  	while i >= row and j <= column
	  		@board[i][j] = option
	  		i -=1
	  		j +=1
	  	end
	  end
	  def move_se(coor, row,column,option)
	  	

	  	i = coor[:x]
	  	j = coor[:y]
	  	while i >= row and j >= column
	  		@board[i][j] = option
	  		i -=1
	  		j -=1
	  	end
	  end

	  def move_right(coor,row,column,option)
	  	j = coor[:y]
	  	while j >= column
	  		@board[row][j] = option
	  		j-=1
	  	end
	  end

	  def move_left(coor,row,column,option)
	  	j = coor[:y]
	  	while j <= column
	  		@board[row][j] = option
	  		j+=1
	  	end 	


	  end
		def check_right(row,column,option,food)
			i, j, profit = row, column, 0
			if @board[row][column] == '*'
				while j < 7 
					j += 1

					if @board[i][j] == food
						

						profit +=1
					end

					break if j == 7

					return {x: i ,y: j} if @board[i][j] == option and profit != 0
				end

			end

			false
		end
		
		def check_left(row,column,option,food)
			i, j, profit = row, column, 0
			if @board[row][column] == '*'
				while j > 0 
					j -= 1

					if @board[i][j] == food
						

						profit +=1
					end

					break if j == 0

					return {x: i ,y: j} if @board[i][j] == option and profit != 0
				end

			end

			false

		end

		def check_up(row,column,option,food)
			i, j, profit = row, column, 0
			if @board[row][column] == '*'
				while i > 0 
					i -= 1
					

					if @board[i][j] == food
						

						profit +=1
					end

					break if i.zero?

					return {x: i ,y: j} if @board[i][j] == option and profit != 0
				end

			end

			false

		end
		def check_down(row,column,option,food)
			i, j, profit = row, column, 0
			if @board[row][column] == '*'
				while i < 7 
					i += 1
					

					if @board[i][j] == food
						

						profit +=1
					end

					break if i == 7

					return {x: i ,y: j} if @board[i][j] == option and profit != 0
				end

			end

			false

		end		

		def check_north_east(row,column,option,food)
			i, j, profit = row, column, 0
			if @board[row][column] == '*'
				while i > 0 and j < 7
					i -= 1
					j += 1

					if @board[i][j] == food
						

						profit +=1
					end

					break if i.zero? or j == 7

					return {x: i ,y: j} if @board[i][j] == option and profit != 0
				end

			end

			false
		end

	def check_north_west(row,column,option,food)
		i, j, profit = row, column, 0
	    if @board[row][column] == '*'
			while i > 0 and j > 0 
				i -= 1
				j -= 1

				if @board[i][j] == food
					

					profit +=1
				end

				break if i.zero? or j.zero?

				return {x: i ,y: j} if @board[i][j] == option and profit != 0
			end

		end

	    false
	end
	def check_south_west(row,column,option,food)
		i, j, profit = row, column, 0
	    if @board[row][column] == '*'
			while i < 7 and j > 0 
				i += 1
				j -= 1

				if @board[i][j] == food
					

					profit +=1
				end

				break if i == 7 or j.zero?

				return {x: i ,y: j} if @board[i][j] == option and profit != 0
			end

		end

	    false
	end
		def check_south_east(row,column,option,food)
			i, j, profit = row, column, 0
			if @board[row][column] == '*'
				while i < 7 and j < 7
					i += 1
					j += 1

					if @board[i][j] == food
						

						profit +=1
					end

					break if i == 7 or j == 7

					return {x: i ,y: j} if @board[i][j] == option and profit != 0
				end

			end

			false
		end	


	def finish?
		!@board.any? { |row| row.any? { |column| column == '*' } }
	end

	def score
		temp = @board.join.to_s
		puts "****************************"
		puts "*  1. oyuncunun skoru : #{temp.count('X')}  *"
		puts "*  2. oyuncunun skoru : #{temp.count('O')}  *"
		puts "****************************"
		first = temp.count('X')
		second = temp.count('O')

		if first > second
			puts "1. Oyuncu Kazandı!  YÜRÜ BE.."
		elsif second > first
			puts "2. Oyuncu Kazandı!  YÜRÜ BE.."
		else
			puts "Berabere Tamamlandı! TEKRAR BEKLERİZ"
		end

	    
	end

		def display_board
			@board.each_with_index do |row, i|
				print "#{i.next} "
				puts row.map { |column| 
					column = column.red if column == 'X' 
					column = column.green if column == 'O' 
					column
				}.join(' ')
			end
			print "0 "
			8.times { |i| print "#{i.next} " }
			puts ''
		end
	end
end