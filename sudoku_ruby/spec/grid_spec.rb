require 'grid.rb'

describe Grid do
  let :grid { described_class.new(input_grid) }
  let :cell { double :cell }
  let :input_grid { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' }
  let :solved_grid { '615493872348127956279568431496832517521746389783915264952681743864379125137254698' }

  it "should have 81 cells" do
    expect(grid.cells.length).to eq 81
  end

  it "should have an initial solved third cell of 5" do
    expect(grid.cells[2]).to eq 5
  end

  it "should solve the sudoku correctly" do
    grid.solve
    expect(grid.output).to eq solved_grid
  end

end
# box A = [1,1]
# box B = [2,1]
# box C = [3,1]
#  if col < 3 === A, then
#    col > 5 === C, then
#       else === B
#    then +1 the second num, until it gets to 9
#    then +1 the first

# [id, row, col, box, cell.to_i]

  # col -------->
# box1    box2    box3
# ['0 1 5|0 0 3|0 0 2'],  2 = row1 col9 box3 === [1,9,3, 2]
# ['0 0 0|1 0 0|9 0 6'],  9 = row2 col7 box3 === [2,7,3, 9]
# ['2 7 0|0 6 8|4 3 0'],  row
# ['----------------'],    |
#  box4  etc..             |
# ['4 9 0|0 0 2|0 1 7'],   \/
# ['5 0 1|0 4 0|3 8 0'],
# ['0 0 3|9 0 5|0 0 0'],
# ['-----------------'],
# ['9 0 0|0 8 1|0 4 0'],
# ['8 6 0|0 7 0|0 2 5'],
# ['0 3 7|2 0 4|6 0 0']
