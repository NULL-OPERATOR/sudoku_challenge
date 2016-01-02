require_relative "cell.rb"
require_relative "grid_setup.rb"

class Grid
  DEF_GRID = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
  attr_reader :cells, :output

  def initialize(input_grid=DEF_GRID, grid_setup_klass=nil, cell_klass=nil)
    @gridsetup = grid_setup_klass || GridSetup.new
    @cells = @gridsetup.new_grid(input_grid)
    @Cell_klass = cell_klass || Cell.new
  end

  def solve
    output = cells.map{ |cell| solved?(cell) ? cell[4] : solve_cell(cell) }
    output.include?(0) ? solve : output.join
  end

  private

  def solved?(cur_cell)
    cur_cell[4] != 0
  end

  def solve_cell(cur_cell)
    val = @Cell_klass.solve(cells_needed(cur_cell))
    @cells[cur_cell[0]][4] = val
    val
  end

  def cells_needed(cur_cell)
    needed = cells.select{|c| c[1] == cur_cell[1] || c[2] == cur_cell[2] || c[3] == cur_cell[3]}
    needed.map!{|x| x[4]}.uniq!
  end

end
