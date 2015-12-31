require 'cell.rb'

describe Cell do
  # let :current_cell { 0 }
  let :relevant_cells { [1,5,3,2,7,4,9,8] }
  let :cell { described_class.new }

  it "returns the reduced outcome" do
    expect(cell.solve(relevant_cells)).to eq [6]
  end
end
