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
  end

  def return_string
    @grid.cells.map{ |cell| cell[4] }.join
  end


  def solve

    init_choices = @grid.choices
    gridsolved = @grid.solve

    if gridsolved
      return_string
    elsif @grid.choices != init_choices
      solve
    else
      add_choices
    end
  end

  def add_choices
    order = find_smallest_choices
    cell = order[0][1]

    input = @grid.choices[cell].shift
    @grid.cells[cell][4] = input

    solve
  end

  def find_smallest_choices
    a = @grid.choices.map.with_index do |cell, index|
      cell == [] ? [] : [cell.length, index]
    end
    a.delete([])
    a.sort_by! &:first
  end



end
