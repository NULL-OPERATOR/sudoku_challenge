require_relative "cell.rb"

class Grid
  attr_reader :cells, :output

  def initialize(input_grid=nil, cell_klass=nil)
    # grid_setup(input_grid)
    @boxes = [[1,1],[2,1],[3,1]]
    grid_setup('015003002000100906270068430490002017501040380003905000900081040860070025037204600')
    @cell_klass = cell_klass || Cell.new
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

  def grid_setup(input_grid)
    row, col = 1, 1
    id = 0
    @cells = input_grid.split(//).map do |cell|

      box = get_box(col)

      a = [id, row, col, box, cell.to_i]
      id += 1
      if col == 9
        row += 1
        col = 1
      else
        col += 1
      end
      a
    end
  end

  def solved?(cur_cell)
    cur_cell[4] != 0
  end

  def get_box(col)
    if col < 4
      box = @boxes[0][0]
      box_update(0)
    elsif col > 6
      box = @boxes[2][0]
      box_update(2)
    else
      box = @boxes[1][0]
      box_update(1)
    end
    box
  end

  def box_update(box)
    if @boxes[box][1] == 9
      @boxes[box][0] += 3
      @boxes[box][1] = 1
    else
      @boxes[box][1] +=1
    end
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
