require_relative 'board'
require_relative 'player'

# Controller for a single match of Tic Tac Toe
# Start a match by calling Game#run
class Game
  WINS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  attr_reader :board, :players
  attr_accessor :turn

  def initialize
    @board = Board.new
    @players = [Player.new(:O), Player.new(:X)]
    @turn = 1
  end

  def win?(piece)
    WINS.any? do |index_list|
      board.spaces.values_at(*index_list).all?(piece)
    end
  end

  def active_player
    players[turn % 2]
  end

  def run
    until turn > 9
      play_turn
      if win?(active_player.piece)
        announce_winner(active_player.piece)
        return
      else
        self.turn += 1
      end
    end
    puts "It's a draw!"
  end

  def play_turn
    board.show
    puts "#{active_player.piece}'s turn!"
    make_move
  end

  def make_move
    location = request_input
    board.place(active_player.piece, location)
  end

  def request_input
    loop do
      print 'Enter desired move: '
      input = gets.chomp.to_i
      if input.between?(1, 9)
        return input unless board.space_occupied?(input)

        puts 'Space already taken! Try again.'
      else
        puts 'Enter a number 1-9.'
      end
    end
  end

  def announce_winner(piece)
    board.show
    puts "#{piece} is the winner!!"
  end
end
