require_relative 'colors'
require_relative 'board'
require_relative 'player'


class Computer
  attr_accessor :name, :code 

  def initialize (name)
    @name = name
  end

  def make_a_code(all_colors)
    @code = all_colors.sample(4)
  end
  
end