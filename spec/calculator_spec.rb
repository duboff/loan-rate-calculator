require 'rspec'
require 'calculator'

describe Calculator do

  let(:calc) {Calculator.new}
  let(:lender_proposals1) {[
                             ['Bob', 0.075, 640],
                             ['Jane', 0.069, 480],
                             ['Fred', 0.071, 520],
                             ['Mary', 0.104, 170],
  ]}
  let(:lender_proposals2) {[
                             ['Bob', 0.075, 640]

  ]}
  let(:amount1) {1000}

  before do
    calc.initial_amount = amount1

  end

  it 'calculates selects correct rate' do
    calc.lender_proposals = lender_proposals1
    calc.get_rate
    expect(calc.rate).to eq 0.07
  end

  it 'error message when there is not enough funds on the market' do
    calc.lender_proposals = lender_proposals2
    calc.get_rate
    expect(calc.rate).to be_nil
  end

  it 'calculates monthly payments correctly' do
    calc.lender_proposals = lender_proposals1
    calc.get_rate
    expect(calc.monthly_payment).to eq 30.88
  end

end
