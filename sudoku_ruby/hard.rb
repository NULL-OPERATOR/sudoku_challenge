require_relative "cell"
require_relative "grid_setup"
require_relative "grid"

class Hard
  EASY_GRID = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
  HARD_GRID = '800000000003600000070090200050007000000045700000100030001000068008500010090000400'
      x=      '81275439 943628157673 9128415423769389  4572126716983543197456876859  13595816473'

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
  def return_string
    @grid.cells.map{ |cell| cell[4] }.join
  end

  # def solve
  #   if @grid.solve
  #     return_string
  #   else
  #     hard_mode
  #     # return
  #   end
  # end

  def solve
    # try to solve again
    # check_grid
    init_choices = @grid.choices
    gridsolved = @grid.solve
    # p @grid.choices
    # @counter = 0
    if gridsolved
      return_string
    elsif @grid.choices != init_choices
      solve
    else
      add_choices
      #need a way of going back if bad ?
    end
  end

  def add_choices
    # start with the cells with the fewest choices
    order = find_smallest_choices
    cell = order[0][1]
    # p "cell #{cell}"
    # p cell.class
    input = @grid.choices[cell].shift
    # p input
    @grid.cells[cell][4] = input

    solve
  end

  def find_smallest_choices
    # order = @grid.choices
    a = @grid.choices.map.with_index do |cell, index|
      cell == [] ? [] : [cell.length, index]
    end
    a.delete([])
    a.sort_by! &:first
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
