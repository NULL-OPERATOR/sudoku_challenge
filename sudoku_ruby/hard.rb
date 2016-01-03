require_relative "cell"
require_relative "grid_setup"
require_relative "grid"

class Hard
  EASY_GRID = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
  HARD_GRID = '800000000003600000070090200050007000000045700000100030001000068008500010090000400'

  attr_reader :cells, :output, :grid

  def initialize(input_grid=HARD_GRID, grid_klass=nil, grid_setup_klass=nil)
    @gridsetup = grid_setup_klass || GridSetup.new
    @cells = @gridsetup.new_grid(input_grid)
    @grid_klass = grid_klass || Grid
    @grid = @grid_klass.new(@cells)
    @not_complete = true
    # @previous_output = []
  end

  # def is_easy?
  #   2.times{@grid.solve}
  # end

  def solve
    if @grid.solve
      @grid.cells.map{ |cell| cell[4] }.join
    else
      # hard_mode
      return
    end
  end
  #
  #
  # def brute
  #   choices = @grid.choices
  #   outcomes = []
  #   cell = 0
  #   choice = 0
  #   choices.each

# 1 add to cells, create a new grid,
#  --> do this step until failing




  # def hard_mode
  #   @cells = @grid.cells
  #   cell = 0
  #   counter = -1
  #   choices = @grid.choices[cell]
  #   if choice == [] || counter > choice.length
  #     counter = 0
  #     cell += 1
  #     hard_mode
  #   else
  #     counter += 1
  #     new_grid(choices[counter], counter, cell)
  #   end
  #   @cells.
  # end
  #
  # def new_grid(choice, counter, cell)
  #   @
  # end
  #
  # def


end
