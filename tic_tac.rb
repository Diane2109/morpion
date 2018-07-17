

class Player # Je détermine la class Player qui détermine les joueurs

  attr_accessor :name_player, :value_player

  def initialize(name_player, value_player)
    @name_player = name_player
    @value_player = value_player
  end

end




class Board # Je détermine la class Board qui détermine le hash qui permet de stocker les X et les O

  def initialize
    @board = {1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ", 7 => " ", 8 => " ", 9 => " "}
  end

end





class Game # Je détermine la class Game qui permet de lancer la totalité du jeu

  def initialize
    puts ""
    puts "Jouons au morpion !"
    puts ""
    puts "Comment s'appelle le premier joueur ?"
    @name_player_1 = gets.chomp.to_s
    @player_1 = Player.new(@name_player_1, "X")
    puts ""
    puts "Ok, parfait ! Et comment s'appelle le deuxième joueur ?"
    @name_player_2 = gets.chomp.to_s
    @player_2 = Player.new(@name_player_2, "O")
    puts ""
    puts "C'est noté ! On peut commencer à jouer !"
    puts ""
    puts "Pour rappel, voici comment fonctionne la grille du morpion. Tu choisis un chiffre pour placer une croix ou un cercle. Voici à quelles cases correspondent les chiffres : "
    puts "  1 | 2 | 3"
    puts " ––- ––- ––-"
    puts "  4 | 5 | 6"
    puts " ––- ––- ––-"
    puts "  7 | 8 | 9"
    puts ""
    @turn = 1
    @board = {1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ", 7 => " ", 8 => " ", 9 => " "}
  end

  def play # Je détermine la méthode qui permet de jouer
    if @turn % 2 == 0 then
      puts ""
      puts "#{@name_player_1}, tu choisis un chiffre entre 1 et 9 :) "
      print "Je choisis le chiffre : "
      number = gets.chomp.to_i
      if @board[number] != " " && number > 0 && number < 10 then puts "Cette case a déjà été jouée. Veuillez choisir un autre chiffre."
        play
      elsif number < 1 || number > 9 then print "Tu dois choisir un chiffre compris entre 1 et 9."
        play
      else @board[number] = @player_1.value_player
      end
      puts @board
      puts ""
      puts " #{@board[1]} | #{@board[2]} | #{@board[3]}"
      puts " ––- ––- ––-"
      puts " #{@board[4]} | #{@board[5]} | #{@board[6]}"
      puts " ––- ––- ––-"
      puts " #{@board[7]} | #{@board[8]} | #{@board[9]}"
      puts ""
      winner
    else
      puts ""
      puts "#{@name_player_2}, tu choisis un chiffre entre 1 et 9 :) "
      print "Je choisis le chiffre : "
      number = gets.chomp.to_i
      if @board[number] != " " && number > 0 && number < 10 then puts "Cette case a déjà été jouée. Veuillez choisir un autre chiffre."
        play
      elsif number < 1 || number > 9 then print "Tu dois choisir un chiffre compris entre 1 et 9."
        play
      else @board[number] = @player_2.value_player
      end
      puts ""
      puts " #{@board[1]} | #{@board[2]} | #{@board[3]}"
      puts " ––- ––- ––-"
      puts " #{@board[4]} | #{@board[5]} | #{@board[6]}"
      puts " ––- ––- ––-"
      puts " #{@board[7]} | #{@board[8]} | #{@board[9]}"
      puts ""
      winner
    end
  end
 end

  def winner # Je détermine la méthode qui permet de savoir si on gagne ou si on fait match nul
    if (@board[1] == @board[2] && @board[2] == @board[3] && @board[1] != " ") || (@board[1] == @board[4] && @board[4] == @board[7] && @board[1] != " ") || (@board[1] == @board[5] && @board[5] == @board[9] && @board[1] != " ") || (@board[2] == @board[5] && @board[5] == @board[8] && @board[2] != " ") || (@board[3] == @board[6] && @board[6] == @board[9] && @board[3] != " ") || (@board[4] == @board[5] && @board[5] == @board[6] && @board[4] != " ") || (@board[7] == @board[8] && @board[8] == @board[9] && @board[7] != " ") || (@board[3] == @board[5] && @board[5] == @board[7] && @board[3] != " ") && @turn % 2 == 0
      then puts "#{@name_player_2} a gagné la partie !"
    elsif (@board[1] == @board[2] && @board[2] == @board[3] && @board[1] != " ") || (@board[1] == @board[4] && @board[4] == @board[7] && @board[1] != " ") || (@board[1] == @board[5] && @board[5] == @board[9] && @board[1] != " ") || (@board[2] == @board[5] && @board[5] == @board[8] && @board[2] != " ") || (@board[3] == @board[6] && @board[6] == @board[9] && @board[3] != " ") || (@board[4] == @board[5] && @board[5] == @board[6] && @board[4] != " ") || (@board[7] == @board[8] && @board[8] == @board[9] && @board[7] != " ") || (@board[3] == @board[5] && @board[5] == @board[7] && @board[3] != " ") && @turn % 2 != 0
      puts "#{@name_player_1} a gagné la partie !"
    elsif @board[1] == " " || @board[2] == " " || @board[3] == " " || @board[4] == " " || @board[5] == " " || @board[6] == " " || @board[7] == " " || @board[8] == " " || @board[9] == " "
      @turn = @turn + 1
      play
    else puts "Jeu terminé. Match nul !"
    end
  end

Game.new.play # Je lance la class Game
