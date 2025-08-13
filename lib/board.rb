require_relative 'errors'

class Board
  include BoardErrors

  PIECES = %i[X O].freeze

  attr_reader :spaces

  def initialize
    @spaces = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def space_occupied?(location)
    PIECES.include?(spaces[location - 1])
  end

  def place(piece, location)
    return InvalidPieceError unless PIECES.include?(piece)

    @spaces[location - 1] = piece
  end

  def show
    # locations mirror numpad
    puts " #{spaces[6]} | #{spaces[7]} | #{spaces[8]} "
    puts '---+---+---'
    puts " #{spaces[3]} | #{spaces[4]} | #{spaces[5]} "
    puts '---+---+---'
    puts " #{spaces[0]} | #{spaces[1]} | #{spaces[2]} "
  end
end
