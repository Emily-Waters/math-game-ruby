require './game_master'
require './player'

total_lives = 3
rounds = 5

gm = GameMaster.new(total_lives, rounds)

p1 = Player.new(total_lives)
p2 = Player.new(total_lives)

currentplayer = p1
other_player = p2
round = 0

until gm.loser?(p1,p2) || round == rounds
  round+=0.5
  gm.round(round.ceil)
  gm.ask_question(currentplayer)
  gm.score(p1,p2)
  currentplayer, other_player = other_player, currentplayer
end

gm.winner(p1,p2)