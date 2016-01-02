require_relative "cell.rb"

class Grid
  attr_reader :cells, :output, :choices

  def initialize(cells, cell_klass=nil)
    @cells = cells
    @Cell_klass = cell_klass || Cell.new
    @choices = Array.new(81){ [] }
    @attempts = 0
  end

  def initial_solve
    return false if @attempts >=2
    @attempts += 1
    output = cells.map{ |cell| solved?(cell) ? cell[4] : solve_cell(cell) }
  end

  def solve
    output = initial_solve
    output.include?(0) ? initial_solve : output.join
  end


  private

  def solved?(cur_cell)
    cur_cell[4] != 0
  end

  def solve_cell(cur_cell)
    output = @Cell_klass.solve(cells_needed(cur_cell))
    update_choices(output, cur_cell)
    update_cells(output, cur_cell)
  end

  def update_cells(output, cur_cell)
    val = output.length > 1 ? 0 : output[0]
    @cells[cur_cell[0]][4] = val
    val
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
