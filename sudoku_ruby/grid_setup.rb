class GridSetup
  def initialize
    @boxes = [[1,1],[2,1],[3,1]]
    @row = 1
    @col = 1
  end

  def new_grid(input_grid)
    cells = input_grid.split(//).map.with_index do |num , index|
      box = get_box
      cell = [index, @row, @col, box, num.to_i]
      check_row
      cell
    end
  end

  private

  def check_row
    if @col == 9
      @row += 1
      @col = 1
    else
      @col += 1
    end
  end

  def get_box
    if @col < 4
      box = @boxes[0][0]
      box_update(0)
    elsif @col > 6
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

end
