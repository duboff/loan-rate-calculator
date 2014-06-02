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
  let(:lender_proposals3) {[
                             ['Bob', 0.075, 640],
                             ['Jane', 0.069, 1500],
                             ['Fred', 0.071, 520],
                             ['Mary', 0.104, 170],
  ]}
  let(:amount1) {1000}

  before do
    calc.initial_amount = amount1

  end

  it 'calculates selects correct rate' do
    calc.lender_proposals = lender_proposals1
    calc.get_rate
    expect(calc.rate.round(3)).to eq 0.070
  end

  it 'calculates selects correct rate' do
    calc.lender_proposals = lender_proposals3
    calc.get_rate
    p calc.rate
    expect(calc.rate.round(3)).to eq 0.069
  end

  it 'error message when there is not enough funds on the market' do
    calc.lender_proposals = lender_proposals2
    calc.get_rate
    expect(calc.rate).to be_nil
  end

  it 'calculates monthly payments correctly' do
    calc.lender_proposals = lender_proposals1
    calc.get_rate
    expect(calc.monthly_payment.round(2)).to eq 30.88
  end

  it 'calculates total payment' do
    calc.lender_proposals = lender_proposals1
    calc.get_rate
    expect(calc.total_payment.round(2)).to eq 1111.64
  end

end
