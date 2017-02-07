require './lib/game'

puts `clear`
run = Reversi::Game.new
run.initialize_board
run.display_board


while !run.finish?
	puts "1. oyuncu (X) koordinat gir örn: 1,5 => (satır,sütun) "
	puts "--------------"
	puts "Çıkmak için q girin"
	a = gets.chomp()
	break if a.downcase() == 'q'

	koordinat_array = a.split(',')
	kor_x = koordinat_array[1].to_i - 1
	kor_y = koordinat_array[0].to_i - 1 
	run.check_move(kor_x,kor_y,'X','O')
	run.display_board

	puts "2. oyuncu (O) koordinat gir örn: 2,5 => (satır,sütun) "
	puts "--------------"
	b = gets.chomp()
	
	break if b.downcase() == 'q'

	koordinat = b.split(',')
	kor2_x = koordinat[1].to_i - 1
	kor2_y = koordinat[0].to_i - 1 
	run.check_move(kor2_x,kor2_y,'O','X')
	run.display_board
end
run.score