require_relative "cell"
require_relative "grid_setup"
require_relative "grid"

class Hard
  EASY_GRID = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
  HARD_GRID = '800000000003600000070090200050007000000045700000100030001000068008500010090000400'

  attr_reader :cells, :output

  def initialize(input_grid=EASY_GRID, grid_klass=nil, grid_setup_klass=nil)
    @gridsetup = grid_setup_klass || GridSetup.new
    @cells = @gridsetup.new_grid(input_grid)
    @grid = grid_klass || Grid.new(@cells)
    @previous_output = []
  end

  def solve
    @grid.solve
    output = @grid.cells.map{ |cell| cell[4] }
    if !output.include?(0)
      output.join
    else output != @previous_output
      @grid.solve
      @previous_output = output
      solve
    # else
    end
  end

end
