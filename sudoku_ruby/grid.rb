require_relative "cell.rb"
require_relative "grid_setup.rb"

class Grid
  DEF_GRID = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
  attr_reader :cells, :output

  def initialize(input_grid=nil, grid_setup=nil, cell=nil)
    @gridsetup = grid_setup || GridSetup.new
    @cells = @gridsetup.new_grid(DEF_GRID)
    @cell_klass = cell || Cell.new
  end

  def solve
    output = cells.map do |cell|
      if solved?(cell)
        cell[4]
      else
        solved_cell = solve_cell(cell)
        if solved_cell == nil
          0
        else
          solved_cell[4]
        end
      end
    end

    if output.include?(0)
      solve
    else
      output.join
    end
  end

  private

  def solved?(cur_cell)
    cur_cell[4] != 0
  end

  def solve_cell(cur_cell)
    val = @cell_klass.solve(cells_needed(cur_cell))
    if val == nil
      return
    end
    new_cell = cur_cell
    new_cell[4] = val
    @cells[cur_cell[0]] = new_cell
  end

  def cells_needed(cur_cell)
    to_add = cells.select{|c| c[1] == cur_cell[1] || c[2] == cur_cell[2] || c[3] == cur_cell[3]}
    to_add.map!{|x| x[4]}.uniq!
  end

end
