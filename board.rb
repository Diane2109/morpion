
class Board # Je détermine la class Board qui détermine le hash qui permet de stocker les X et les O

  def initialize
    BoardCase.new
    @boardcase = Hash.new
  end

end
