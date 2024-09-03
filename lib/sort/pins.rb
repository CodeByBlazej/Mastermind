class Pin
  attr_accessor :color

  def initialize (color)
    @color = color
  end

  def show_me
    p "I am #{@color}"
  end
end