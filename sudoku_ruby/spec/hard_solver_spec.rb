require_relative "../hard_solver"

describe HardSolver do
  let(:grid) { double(:grid) }
  let(:gridsetup) { double(:gridsetup) }
  let(:input_grid) { '0000' }

  subject(:hardsolver){ described_class.new(input_grid, grid, gridsetup)}

  # allow(grid).to_receive
  it "sets up a grid" do
    expect(hardsolver.cells).to eq input_grid
  end

end
