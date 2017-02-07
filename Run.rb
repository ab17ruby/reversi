require './lib/game'

run = Reversi::Game.new
run.initialize_board
run.display_board
run.check_move(4,2,'X','O')
puts "--------------"
run.display_board