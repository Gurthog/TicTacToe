module BoardErrors
  class InvalidPieceError < StandardError
    def initialize
      super('Piece provided not valid.')
    end
  end
end
