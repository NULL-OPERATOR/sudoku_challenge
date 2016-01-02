require_relative "cell"
require_relative "grid_setup"
require_relative "grid"

class HardSolver
  EASY_GRID = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
  HARD_GRID = ''

  attr_reader :cells, :output

  def initialize(input_grid=EASY_GRID, grid_klass=nil, grid_setup_klass=nil)
    @grid = grid_klass || Grid
    @gridsetup = grid_setup_klass || GridSetup.new
    @cells = @gridsetup.new_grid(input_grid)
  end

  def solve
    @current_grid = @grid.new(@cells)
    @current_grid.solve
  end

  # if row/grid/bow isnt right-
  #   break
  # else continue adding numbers

  # def solve
  #   output = initial_solve
  #   output.include?(0) ? initial_solve : output.join
  # end
  #
  # return false if @attempts >=2
  # @attempts += 1
end
