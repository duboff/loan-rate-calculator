require 'rspec'
require 'calculator'

describe Calculator do
  it 'calculates selects correct rate' do
    calc = Calculator.new
    calc.initial_amount = 1000
    calc.lender_proposals = [
      ['Bob', 0.075, 640],
      ['Jane', 0.069, 480],
      ['Fred', 0.071, 520],
      ['Mary', 0.104, 170],
    ]
    calc.get_rate
    expect(calc.rate).to eq 0.07
  end
end
