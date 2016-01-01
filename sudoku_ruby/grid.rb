class Grid
  attr_reader :cells, :output

  def initialize(input_grid, cell)
    grid_setup(input_grid)
    @cell = cell || Cell.new
  end

  def solve
    cells.each do |cell|
      solved?(cell) ? next : solve_cell(cell)
    end
  end

  private

  def grid_setup(input_grid)

    boxA, boxB, boxC = [1,1], [2,1], [3,1]
    row, col = 1, 1
    @cells = input_grid.split(//).map.with_index do |cell, index|
      box = boxA[0]
      if col < 4
        if boxA[1] == 9
          boxA[0] += 1
          boxA[1] = 1
        end

      elsif col > 6
        box = boxC[0]
        if boxB[1] == 9
          boxB[0] += 1
          boxB[1] = 1
        end

      else
        box = boxB[0]
        if boxB[1] == 9
          boxB[0] += 1
          boxB[1] = 1
        end
      end

      a = [row, col, box, cell]

      if col == 9
        row += 1
        col = 1
      else
        col += 1
      end

      a
    # column = multiples of 1-9
    # plus row no. 1-9, resetting every row
    end
  end

  def solved?(current_cell)
    current_cell != 0
  end

  def solve_cell(current_cell)
    cells = cells_needed(current_cell)
    @cell.solve(cells)
  end

  def cells_needed(current_cell)
  end
end
