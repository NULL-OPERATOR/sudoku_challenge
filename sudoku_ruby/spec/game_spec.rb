require 'game.rb'
require 'spec_helper'

describe Game do
  let :game { described_class.new(input_grid) }

  it "should have a solved third cell of 5" do
    expect(grid.cell[2]).to eq 5
  end

  it "should solve the first cell as 2" do
    grid.solve
    expect(grid.output).to eq
  end
end
