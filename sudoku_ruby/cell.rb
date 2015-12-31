class Cell
  FULL_SET = [0,1,2,3,4,5,6,7,8,9]

  def solve(relevant_cells)
    FULL_SET - @relevant_cells
  end

end
