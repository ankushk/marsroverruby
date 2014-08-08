class InvalidMoveError < StandardError
  def initialize(cause)
    @cause = cause
  end
end