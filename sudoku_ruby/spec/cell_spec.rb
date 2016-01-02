require_relative '../cell'

describe Cell do
  # let :current_cell { 0 }
  let(:relevant_cells){ [0,1,5,3,2,7,4,9,8] }
  subject(:cell) { described_class.new }

  it "returns the reduced outcome" do
    expect(cell.solve(relevant_cells)).to eq [6]
  end
end
