class GameMaster

  def initialize(total_lives, rounds)
    sleep(0.5)
    print "\nWelcome to MathGame! A 2 player game where you take turns answering simple math questions. You have #{total_lives} lives and #{rounds} rounds to play. The game is over when one player runs out of lives or there are no rounds left. BEGIN!!!\n\n"
    @total_lives = total_lives
    @rounds = rounds
  end

  def ask_question(player)

    first_val = rand(1..10)
    second_val = rand(1..10)
    operator_decider = rand(1..3)

    if operator_decider == 1
      operator = " + "
      @answer_val = first_val + second_val
    elsif operator_decider == 2
      operator = " - "
      @answer_val = first_val - second_val
    elsif operator_decider == 3
      operator = " * "
      @answer_val = first_val * second_val
    end
      print "\r#{player.name}, what is: #{first_val}#{operator}#{second_val} ? => "
      player_answer = gets.chomp.to_i

      self.check_answer(player_answer, player)
  end

  def check_answer(player_answer, player)
    sleep(0.5)
    @winner = player_answer == @answer_val
    if @winner
      print "\rCorrect!\n"
    else
      player.lose_lives
      print "\rWrong! The correct answer is #{@answer_val}!\n"
    end
  end

  def score(p1,p2)
    sleep(0.5)
    print "\rThe score is: #{p1.name} => #{p1.lives}/#{@total_lives} | #{p2.name} => #{p2.lives}/#{@total_lives}\n"
  end

  def loser?(p1,p2)
    p1.lives == 0 || p2.lives == 0
  end

  def round(round_num)
    if round_num == @rounds
      puts "\nFinal Round!\n"
    else
      puts "\nRound #{round_num}: \n"
    end
  end

  def winner(p1,p2)
    sleep(0.5)
    if p1.lives == p2.lives
      puts "\nTie Game!"
    else
      puts "\n#{p1.lives > p2.lives ? p1.name : p2.name} wins the game!"
    end
  end
end
