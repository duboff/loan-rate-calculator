require 'csv_processor'

describe CSVProcessor do

  let(:processor) {CSVProcessor.new}

  before { processor.path = './spec/market.csv' }

  it 'takes a csv file and ' do
    arr = [["Lender", "Rate", "Available"],
           ["Bob", 0.075, 640],
           ["Jane", 0.069, 480],
           ["Fred", 0.071, 520],
           ["Mary", 0.104, 170],
           ["John", 0.081, 320],
           ["Dave", 0.074, 140],
           ["Angela", 0.071, 60]]
    expect(processor.input).to eq arr
  end

  it 'formats the output array' do
    arr = [
      ["Bob", 0.075, 640],
      ["Jane", 0.069, 480],
      ["Fred", 0.071, 520],
      ["Mary", 0.104, 170],
      ["John", 0.081, 320],
      ["Dave", 0.074, 140],
      ["Angela", 0.071, 60]
    ]
    expect(processor.output).to eq arr
  end
end
