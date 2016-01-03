require_relative "cell"

class Grid
  attr_reader :cells, :output, :choices

  def initialize(cells, cell_klass=nil)
    @cells = cells
    @cell_klass = cell_klass || Cell.new
    @choices = Array.new(81){ [] }
  end

  def solve
    2.times{ @cells.each{|cell| solver(cell)}}
    !spaces?
  end

  # def single_solve
  #   @cells.each{|cell| solver(cell)}
  # end

  private

  def solver(cell)
    cell[4] == 0 ? solve_cell(cell) : update_choices([cell[4]], cell)
  end

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
