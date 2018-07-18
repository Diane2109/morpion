
class Player # Je détermine la class Player qui détermine les joueurs

  attr_accessor :name_player, :value_player

  def initialize(name_player, value_player)
    @name_player = name_player
    @value_player = value_player
  end

end
