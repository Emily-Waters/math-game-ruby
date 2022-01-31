class Player

  @@instances = 0
  attr_accessor :name, :lives

  def initialize(lives)
    @@instances+=1
    @id = @@instances
    print "\rPlayer #{@id}, what is your name? => "
    name = gets.chomp
    @name = name
    @lives = lives
    sleep(0.5)
  end

  def lose_lives
    @lives-=1
  end

end

