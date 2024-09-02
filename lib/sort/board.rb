class Board
  attr_accessor :hidden_row, :guess_row, :hint_row

  def initialize 
    @hidden_row = Array.new(4)
    @guess_row = Array.new(4)
    @hint_row = Array.new(2) { Array.new(2) }
  end
end