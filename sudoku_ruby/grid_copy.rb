require_relative "cell"
require_relative "grid_setup"


class Grid
  attr_reader :cells, :output, :choices
  EASY_GRID = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
  HARD_GRID = '800000000003600000070090200050007000000045700000100030001000068008500010090000400'


  def initialize(input_cells=EASY_GRID, cell_klass=nil)
    @gridsetup = GridSetup.new
    @cells = gridsetup.new_grid(input_cells)
    @cell_klass = cell_klass || Cell.new
    @choices = Array.new(81){ [] }
  end

  def solve
    @cells.each{|cell| cell[4] == 0 ? solve_cell(cell) : next }#solver(cell)}
    !spaces?
  end

  def solve_hard
    
  end

  # def single_solve
  #   @cells.each{|cell| solver(cell)}
  # end

  private

  # def solver(cell)
  #   cell[4] == 0 ? solve_cell(cell) : update_choices([cell[4]], cell)
  # end

  def spaces?
    @cells.map{|cell| cell[4] }.include?(0)
  end

  def solve_cell(cur_cell)
    output = @cell_klass.solve(cells_needed(cur_cell))
    update_choices(output, cur_cell)
    val = output.length > 1 ? 0 : output[0]
    @cells[cur_cell[0]][4] = val
  end

  def update_choices(val, cur_cell)
    @choices[cur_cell[0]] = val
  end

  def cells_needed(cur_cell)
    cell_list = cells.select do |c|
      c[1] == cur_cell[1] || c[2] == cur_cell[2] || c[3] == cur_cell[3]
    end
    cell_list.map!{|cell| cell[4]}.uniq!
  end

end
