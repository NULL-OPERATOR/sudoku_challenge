class Cell
  FULL_SET = [0,1,2,3,4,5,6,7,8,9]

  def solve(input_cells)
    output = FULL_SET - input_cells
    output.length > 1 ? nil : output[0]
  end

end
