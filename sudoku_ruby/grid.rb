require 'grid.rb'
require 'spec_helper.rb'

describe Grid do
  let :grid { described_class.new(input_grid) }
  let :cell { double :cell }

  it "should display the input grid" do
    expect(grid.show).to eq output_grid
  end

  it "should have 81 cells" do
    expect(grid.cells.length).to eq 81
  end

end
